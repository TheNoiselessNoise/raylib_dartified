export 'dart:io';
export 'package:analyzer/dart/analysis/utilities.dart';
export 'package:analyzer/dart/ast/ast.dart';
export 'package:analyzer/dart/ast/token.dart';
export 'package:analyzer/dart/ast/visitor.dart';
import '';

extension FileEntityExt on FileSystemEntity {
  String get baseName => uri.pathSegments.where((s) => s.isNotEmpty).last;
}

void validateFile(String path, List<AstVisitor> visitors) {
  final result = parseFile(
    path: path,
    featureSet: .latestLanguageVersion(),
  );

  for (final visitor in visitors) {
    result.unit.accept(visitor);
  }
}
