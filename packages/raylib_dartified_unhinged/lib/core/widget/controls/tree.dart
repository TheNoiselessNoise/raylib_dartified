part of '../../raylib_dartified_unhinged.dart';

final class FTree<T extends App<T>> extends FWidgetLeaf<T> {
  double indent;
  final List<FTreeNode<T>> nodes;

  FTree(
    super.app, {
    super.key,
    this.nodes = const [],
    this.indent = 16,
  }) : super(children: nodes);

  @override
  bool get _ownsChildrenDrawOrder => true;

  @override
  void layout(FConstraints constraints) {
    double layoutNode(FTreeNode<T> node, int depth, double parentStartY, double y) {
      node._doLayout(.loose(.vec2(constraints.maxWidth, double.infinity)));

      node.localOffset = .vec2(indent, y - parentStartY);

      double currentY = y + node.size.y;

      if (node.expanded) {
        for (final c in node.nodes) {
          currentY = layoutNode(c, depth + 1, y, currentY);
        }
      }

      return currentY;
    }

    double y = 0;
    for (final n in nodes) {
      y = layoutNode(n, 0, y, y);
    }

    size = .vec2(constraints.maxWidth, y);
  }

  @override
  @mustCallSuper
  void _doDraw(double dt) {
    super._doDraw(dt);

    for (final c in nodes) {
      c._doDraw(dt);
    }
  }

  @override
  FTree<T> createInstance() => .new(app);

  @override
  void cloneWidgetInto(FWidget<T> copy) {
    if (copy is! FTree<T>) return;
    copy.indent = indent;
  }
}

final class FTreeNode<T extends App<T>> extends FWidgetLeaf<T> {
  bool expanded;
  bool selected;
  final FWidget<T> header;
  final List<FTreeNode<T>> nodes;

  void Function(FTreeNode<T> self)? onClickFn;
  void Function(FTreeNode<T> self)? onExpandedChanged;

  FTreeNode(
    super.app, {
    super.key,
    required this.header,
    this.nodes = const [],
    this.expanded = false,
    this.selected = false,
    this.onClickFn,
    this.onExpandedChanged,
  }) : super(children: [header, ...nodes]);

  @override
  bool get _ownsChildrenDrawOrder => true;

  @override
  bool get _drawEnabled {
    if (parentWidget case FTreeNode<T> parentNode) {
      return parentNode.expanded;
    }

    return super._drawEnabled;
  }

  @override
  void layout(FConstraints constraints) {
    header._doLayout(constraints);
    size = header.size;
  }

  @override
  @mustCallSuper
  void _doOnPostUpdate(double dt) {
    header._doOnPostUpdate(dt);

    final headerInteract = header.get<CWidgetMouseInteractable<T>>()!;

    if (children.isNotEmpty) {
      if (headerInteract.clicked) {        
        findParentControl<FTree<T>>()!.setState(() {
          onClickFn?.call(this);
          selected = !selected;
          expanded = !expanded;
          onExpandedChanged?.call(this);
        });
      }
    }

    super._doOnPostUpdate(dt);
  }

  @override
  FTreeNode<T> createInstance() => .new(app, header: header);

  @override
  void cloneWidgetInto(FWidget<T> copy) {
    if (copy is! FTreeNode<T>) return;
    copy.expanded = expanded;
  }
}