import 'base.dart';

// Slots used by RaylibModuleD (lib/core/base.dart)
// NOTE: unused and out of date 
final uniqueSlotVisitor = UniqueSlotVisitor([
  '_int1', '_int1OrNull', '_int2OrNull', '_int3OrNull',
  '_uInt1', '_uInt2', '_uInt3',
  '_float1',
  '_bool1', '_bool1OrNull',
  '_string1',

  // Structs

  '_vec2List', '_vec21', '_vec22', '_vec23', '_vec24', '_vec25',
  '_vec3List', '_vec31', '_vec32', '_vec33', '_vec34',
  '_vec41',
  '_color1', '_color2', '_color3', '_color4',
  '_imageList', '_image1', '_image2',
  '_camera2D1',
  '_camera3D1',
  '_texture1',
  '_nPatchInfo1',
  '_renderTexture1',
  '_shader1',
  '_font1',
  '_matrixList', '_matrix1', '_matrix2',
  '_rect1', '_rect2', '_rect3',
  '_doGlyphInfos',
  '_ray1',
  '_bbox1', '_bbox2',
  '_mesh1',
  '_material1',
  '_model1',
  '_modelAnim1',
  '_rlRenderBatch1',
  '_audioStream1',
  '_music1',
  '_automationEventList1',
  '_vrDeviceInfo1',
  '_vrStereoConfig1',
  '_automationEvent1',
  '_sound1',
  '_wave1', '_wave2',
  '_light1',
]);

final runCallVisitor = RunCallVisitor();

void main() {
  final dartModulesDir = Directory('../../lib/core/modules/dart');

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

  for (final moduleDir in moduleDirs) {
    final moduleFile = File('${moduleDir.path}/module.dart');
    final moduleName = moduleDir.baseName;

    if (!moduleFile.existsSync()) {
      print("[!] Module '$moduleName' does not have module.dart file. Skipping...");
      continue;
    }

    print("Validating module '$moduleName'...");

    validateFile(moduleFile.path, [
      uniqueSlotVisitor,
      runCallVisitor,
    ]);
  }
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

class UniqueSlotVisitor extends RecursiveAstVisitor<void> {
  final List<String> slots;

  UniqueSlotVisitor(this.slots);

  @override
  void visitMethodDeclaration(MethodDeclaration node) {
    _check(node.name.lexeme, node.body, node.offset);
    super.visitMethodDeclaration(node);
  }

  void _check(String name, FunctionBody body, int offset) {
    final source = body.toSource();
    
    final seen = <String>{};
    final dupes = <String>{};

    for (final slot in slots) {
      final matches = slot.allMatches(source);
     
      for (final m in matches) {
        final slot = m.group(0)!;
        if (!seen.add(slot)) dupes.add(slot);
      }
    }

    if (dupes.isNotEmpty) {
      print('  $name(): duplicate ${dupes.join(', ')}');
    }
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
