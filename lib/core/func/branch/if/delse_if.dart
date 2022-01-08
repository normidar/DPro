import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../../code_lines.dart';
import '../../../dobject.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
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
