import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../../code_lines.dart';
import '../../../dobject.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
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
