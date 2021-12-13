import 'package:cli/core/code_lines.dart';
import 'package:cli/core/dobject.dart';
import 'package:cli/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

class DElseIf extends DObject {
  DObject condition;
  CodeLines lines;
  DElseIf({required this.condition, required this.lines});
  @override
  String tran(LanguageTip tip) {
    lines.addIndent();
    final format = tip.ruleMap()["elif"]!;
    return sprintf(format, [
      condition.tran(tip),
      lines.tran(tip),
    ]);
  }
}