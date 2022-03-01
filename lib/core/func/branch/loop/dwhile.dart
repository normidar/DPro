import 'package:dpro/core/code_lines.dart';
import 'package:dpro/core/dobject.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DWhile implements DObject {
  DObject get condition;
  DCodeLines get lines;
  @override
  String tran(LanguageTip tip) {
    lines.addIndent();
    final format = tip.getRule("while");
    return sprintf(format, [
      condition.tran(tip),
      lines.tran(tip),
      " " * tip.indent,
    ]);
  }
}

class OWhile with DWhile {
  @override
  DObject condition;
  @override
  DCodeLines lines;
  OWhile({required this.condition, required this.lines});
}
