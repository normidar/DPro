import 'package:auto_exporter/auto_exporter.dart';
import 'package:dpro/core/func/branch/function/dparams.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../../code_lines.dart';
import '../../../dobject.dart';

@AutoExporter()
class DConstructor extends DObject {
  String? name;
  DParams? params;
  CodeLines lines;
  DConstructor({
    this.name,
    this.params,
    required this.lines,
  });

  @override
  String tran(LanguageTip tip) {
    lines.addIndent();
    final format = tip.getRule("func");
    final _paras = params;
    return sprintf(format, [
      name,
      _paras != null ? _paras.tran(tip) : "",
      lines.tran(tip),
      " " * tip.indent,
    ]);
  }
}
