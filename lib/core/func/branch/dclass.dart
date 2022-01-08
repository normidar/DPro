import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../code_lines.dart';
import '../../dobject.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
class DClass extends DObject {
  String name;
  CodeLines lines;
  DClass({required this.name, required this.lines});

  @override
  String tran(LanguageTip tip) {
    lines.addIndent();
    final format = tip.ruleMap()["class"]!;
    return sprintf(format, [
      name,
      lines.tran(tip),
      " " * tip.indent,
    ]);
  }
}
