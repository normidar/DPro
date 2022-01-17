import 'package:auto_exporter/auto_exporter.dart';
import 'package:dpro/core/func/branch/function/dpara.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../../code_lines.dart';
import '../../../dobject.dart';

@AutoExporter()
class DFunc extends DObject {
  DType type;
  String name;
  List<DPara> paras;
  CodeLines lines;
  DFunc(
      {required this.type,
      required this.name,
      required this.lines,
      this.paras = const []});

  @override
  String tran(LanguageTip tip) {
    lines.addIndent();
    final format = tip.ruleMap()["func"]!;
    final _paraStr = paras.map((e) => e.tran(tip)).join(", ");
    return sprintf(format, [
      type.tran(tip),
      name,
      _paraStr,
      lines.tran(tip),
      " " * tip.indent,
    ]);
  }
}
