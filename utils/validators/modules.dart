import 'base.dart';

final identicalVisitor = IdenticalVisitor();

final runCallVisitor = RunCallVisitor();

void main() {
  // final dartModulesDir = Directory('../../lib/core/modules/dart');
  final dartModulesDir = Directory('../../../raylib_dartified_web/lib/core/modules');

  if (!dartModulesDir.existsSync()) {
    print('[!] Dart modules dir does not exist: ${dartModulesDir.path}');
    return;
  }

  final moduleDirs = dartModulesDir
    .listSync()
    .whereType<Directory>()
    .toList()
  ..sort((a, b) => a.path.compareTo(b.path));

  if (moduleDirs.isEmpty) {
    print('[!] No modules found');
    return;
  }

  final moduleFile = File('${dartModulesDir.path}/core/module.dart');
  final moduleName = 'core';

  if (!moduleFile.existsSync()) {
    print("[!] Module '$moduleName' does not have module.dart file. Skipping...");
    return;
  }

  print("Validating module '$moduleName'...");

  validateFile(moduleFile.path, [
    identicalVisitor,
    runCallVisitor,
  ]);

  // for (final moduleDir in moduleDirs) {
  //   final moduleFile = File('${moduleDir.path}/module.dart');
  //   final moduleName = moduleDir.baseName;

  //   if (!moduleFile.existsSync()) {
  //     print("[!] Module '$moduleName' does not have module.dart file. Skipping...");
  //     continue;
  //   }

  //   print("Validating module '$moduleName'...");

  //   validateFile(moduleFile.path, [
  //     identicalVisitor,
  //     runCallVisitor,
  //   ]);
  // }
}

extension on AnnotatedNode {
  bool get isOverride => metadata.any((a) => a.name.name == 'override');

  Annotation? get doNotValidate => metadata
    .where((a) => a.name.name == 'DoNotValidate')
    .firstOrNull;

  bool get shouldBeSkipped => doNotValidate != null;

  String? get skipReason => (doNotValidate?.arguments?.arguments.firstOrNull as StringLiteral?)?.stringValue;

  void printSkipReason([String? prefix]) {
    final reason = skipReason;
    if (reason != null) print('${prefix ?? ''}$reason');
  }
}

class IdenticalVisitor extends RecursiveAstVisitor<void> {
  IdenticalVisitor();

  @override
  void visitMethodDeclaration(MethodDeclaration node) {
    _check(node);
    super.visitMethodDeclaration(node);
  }

  void _check(MethodDeclaration node) {
    if (node.shouldBeSkipped) return;

    bool hasCheckIdentical = node.toSource().contains('_checkIdentical');
    if (hasCheckIdentical) return;

    final List<FormalParameter> params = node.parameters?.parameters ?? [];
    if (params.isEmpty) return;

    final List<String> namedTypes = [];
    for (final param in params) {
      final type = param.childEntities.first;
      if (type is! NamedType) continue;
      namedTypes.add(type.name.lexeme);
    }

    final skip = ['List', 'Map', 'int', 'String', 'double', 'num'];
    final filtered = namedTypes.where((p) => !skip.contains(p)).toList();

    final Map<String, int> seen = {};

    for (final type in filtered) {
      seen.putIfAbsent(type, () => 0);
      seen[type] = seen[type]! + 1;
    }

    final filteredSeen = seen.entries.where((e) => e.value > 1).toList();
    if (filteredSeen.isEmpty) return;

    print('  ${node.name.lexeme}(): possible identicals: ${filteredSeen.map((e) => e.key).join(', ')}');
  }
}

class RunCallVisitor extends RecursiveAstVisitor<void> {
  @override
  void visitMethodDeclaration(MethodDeclaration node) {
    _check(node);
    super.visitMethodDeclaration(node);
  }

  void _check(MethodDeclaration node) {
    if (node.isOverride) return;
    if (node.shouldBeSkipped) return node.printSkipReason(' ${node.name.lexeme}: ');

    final source = node.body.toSource();
    if (!source.contains('=> run(')) {
      print('  ${node.name.lexeme}(): does not use run()');
    }
  }
}
