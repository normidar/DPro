import 'package:auto_exporter/auto_exporter.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../../code_lines.dart';
import '../../../dobject.dart';

@AutoExporter()
class DFunc extends DObject {
  DType type;
  String name;
  CodeLines lines;
  DFunc({required this.type, required this.name, required this.lines});

  @override
  String tran(LanguageTip tip) {
    lines.addIndent();
    final format = tip.ruleMap()["func"]!;
    return sprintf(format, [
      type.tran(tip),
      name,
      '',
      lines.tran(tip),
      " " * tip.indent,
    ]);
  }
}
