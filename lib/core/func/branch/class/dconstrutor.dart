import 'package:dpro/core/code_lines.dart';
import 'package:dpro/core/dobject.dart';
import 'package:dpro/core/func/branch/function/dparams.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DConstructor implements DStatement {
  String? get name;
  DParams? get params;
  DCodeLines get lines;

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
  DCodeLines lines;
  @override
  DParams? params;

  OConstructor({
    this.name,
    this.params,
    required this.lines,
  });
}
