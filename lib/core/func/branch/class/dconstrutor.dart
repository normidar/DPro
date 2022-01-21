import 'package:auto_exporter/auto_exporter.dart';
import 'package:dpro/core/func/branch/function/dparams.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../../code_lines.dart';
import '../../../dobject.dart';

@AutoExporter()
abstract class DConstructor implements DObject {
  String? get name;
  DParams? get params;
  CodeLines get lines;

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

class OConstructor with DConstructor {
  @override
  String? name;
  @override
  CodeLines lines;
  @override
  DParams? params;

  OConstructor({
    this.name,
    this.params,
    required this.lines,
  });
}
