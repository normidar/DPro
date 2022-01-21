import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../code_lines.dart';
import '../../dobject.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
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
