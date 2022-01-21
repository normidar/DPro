import 'package:auto_exporter/auto_exporter.dart';
import 'package:dpro/core/func/branch/function/dparams.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../../code_lines.dart';
import '../../../dobject.dart';

@AutoExporter()
abstract class DFunc implements DObject {
  DType get type;
  String get name;
  DParams? get paras;
  DCodeLines get lines;

  @override
  String tran(LanguageTip tip) {
    lines.addIndent();
    final format = tip.getRule("func");
    final _paras = paras;
    return sprintf(format, [
      type.tran(tip),
      name,
      _paras != null ? _paras.tran(tip) : "",
      lines.tran(tip),
      " " * tip.indent,
    ]);
  }
}

class OFunc with DFunc {
  @override
  String name;
  @override
  DType type;
  @override
  DParams? paras;
  @override
  DCodeLines lines;

  OFunc(
      {required this.type,
      required this.name,
      required this.lines,
      this.paras});
}
