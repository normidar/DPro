import 'package:dpro/core/code_lines.dart';
import 'package:dpro/core/dobject.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DElseIf implements DObject {
  DObject get condition;
  DCodeLines get lines;

  @override
  String tran(LanguageTip tip) {
    lines.addIndent();
    final format = tip.getRule("elif");
    return sprintf(format, [
      condition.tran(tip),
      lines.tran(tip),
    ]);
  }
}

class OElseIf with DElseIf {
  @override
  DObject condition;
  @override
  DCodeLines lines;

  OElseIf({required this.condition, required this.lines});
}
