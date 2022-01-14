import 'package:auto_exporter/auto_exporter.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../code_lines.dart';
import '../../dobject.dart';

@AutoExporter()
class DForE extends DObject {
  DType type;
  DObject list;
  CodeLines lines;
  String varName;
  DForE({
    required this.type,
    required this.list,
    required this.lines,
    this.varName = "e",
  });

  @override
  String tran(LanguageTip tip) {
    lines.addIndent();
    final format = tip.ruleMap()["foreach"]!;
    return sprintf(format, [
      type.tran(tip),
      varName,
      list.tran(tip),
      lines.tran(tip),
      " " * tip.indent,
    ]);
  }
}
