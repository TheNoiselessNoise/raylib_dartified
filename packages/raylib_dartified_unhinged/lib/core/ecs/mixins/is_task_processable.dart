part of '../../raylib_dartified_unhinged.dart';

/// Adds [Task] processing capabilities to an ECS object.
///
/// Tasks are queued and executed in a controlled pipeline each frame.
/// Listeners can intercept and cancel tasks before they reach [onTask] or execute.
mixin IsTaskProcessable<
  T extends App<T>,
  E extends ECSBase<T>
> on
  Self<E>,
  IsEventEmittable<T, E>
{
  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██   ░██         
  // ░██████████ ░██     ░██ ░██     ░██ ░███████     ░████████  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██           ░██ 
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   

  /// Hook key for [IsTaskProcessable]'s [onTask] hooks.
  late final hookKey_onTask = ECSHookKey<void Function(E self, Task<T> task)>(
    '$IsTaskProcessable', 'onTask'
  );

  /// Registers [fn] to be called for each task before it is executed.
  @nonVirtual
  E listenOnTask(void Function(E self, Task<T> task) fn) {
    addHook(hookKey_onTask, fn);
    return self;
  }

  @mustCallSuper
  bool _doCanceledTask(Task<T> task) {
    if (!task.isCanceled) return false;
    emit(EventTaskCancelled(app, task));
    return true;
  }

  // (internal) called by task system to propagate task
  // by default just call the hooks
  @mustCallSuper
  bool _doTask(Task<T> task, double dt) {
    final isFirstRun = !task._hasStarted;
    task._hasStarted = true;
    if (isFirstRun) emit(EventTaskStarting(app, task));
    if (_doCanceledTask(task)) return true;
    for (final f in hooksOf(hookKey_onTask)) {
      if (_doCanceledTask(task)) return true;
      f(self, task);
    }
    if (_doCanceledTask(task)) return true;
    if (isFirstRun) onTask(task);
    if (_doCanceledTask(task)) return true;
    final result = task._doUpdate(dt);
    if (result) emit(EventTaskFinished(app, task));
    return result;
  }

  /// Override to intercept tasks before they execute.
  ///
  /// Called after all [listenOnTask] listeners and before [Task] is executed.
  /// The task can be canceled here via [Task.cancel].
  void onTask(Task<T> task) {}

  // ░██████░███     ░███ ░█████████  ░██         
  //   ░██  ░████   ░████ ░██     ░██ ░██         
  //   ░██  ░██░██ ░██░██ ░██     ░██ ░██         
  //   ░██  ░██ ░████ ░██ ░█████████  ░██         
  //   ░██  ░██  ░██  ░██ ░██         ░██         
  //   ░██  ░██       ░██ ░██         ░██         
  // ░██████░██       ░██ ░██         ░██████████ 

  /// State key for [IsTaskProcessable]'s [_taskQueue].
  late final stateKey_taskQueue = ECSStateKey<Set<Task<T>>>(
    '$IsTaskProcessable', 'taskQueue',
    get: () => .from(_taskQueue),
    set: (value) => _taskQueue = value,
  );

  /// State key for [IsTaskProcessable]'s [_pendingTaskQueue].
  late final stateKey_pendingTaskQueue = ECSStateKey<Set<Task<T>>>(
    '$IsTaskProcessable', 'pendingTaskQueue',
    get: () => .from(_pendingTaskQueue),
    set: (value) => _pendingTaskQueue = value,
  );

  @override
  @mustCallSuper
  void _registerBuiltinStateKeys() {
    super._registerBuiltinStateKeys();
    registerStateKey(stateKey_taskQueue);
    registerStateKey(stateKey_pendingTaskQueue);
  }

  Set<Task<T>> _taskQueue = {};
  
  Set<Task<T>> _pendingTaskQueue = {};

  @visibleForTesting
  Set<Task<T>> get taskQueueForTesting => _taskQueue;

  @visibleForTesting
  Set<Task<T>> get pendingTaskQueueForTesting => _pendingTaskQueue;

  /// Enqueues [task] for execution starting at the end of the current frame.
  @override
  void task(Task<T> task) {
    if (task._isQueued) return;
    task._isQueued = true;
    task._reset();
    _pendingTaskQueue.add(task);
  }

  /// Enqueues [task] and executes it immediately at the end of the current frame,
  /// if it isn't already running.
  @override
  E run(Task<T> task) {
    if (task._isQueued) return self;
    task._isQueued = true;
    task._reset();
    _pendingTaskQueue.add(task);

    final done = _doTask(task, time.dt);
    if (done) {
      _pendingTaskQueue.remove(task);
      task._isQueued = false;
    }
    return self;
  }

  void _processTasks(double dt) {
    if (_pendingTaskQueue.isNotEmpty) {
      _taskQueue.addAll(_pendingTaskQueue);
      _pendingTaskQueue.clear();
    }
    _taskQueue.removeWhere((task) {
      final done = _doTask(task, dt);
      if (done) task._isQueued = false;
      return done;
    });
  }

  /// Clears task queue.
  void clearTaskQueue() {
    _taskQueue.clear();
    _pendingTaskQueue.clear();
  }

  /// Synchronously drains the pending task queue.
  ///
  /// Intended for tests that need deterministic control over when queued
  /// tasks are processed, decoupled from [Scene._doEndFrame]'s callback
  /// interleaving. Not meant for production code.
  @visibleForTesting
  void processTaskQueueForTest([double dt = 1]) => _processTasks(dt);
}