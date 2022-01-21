import 'package:auto_exporter/auto_exporter.dart';
import 'package:dpro/core/func/branch/function/dparams.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../../code_lines.dart';
import '../../../dobject.dart';

@AutoExporter()
class DFunc extends DObject {
  DType type;
  String name;
  DParams? paras;
  CodeLines lines;
  DFunc(
      {required this.type,
      required this.name,
      required this.lines,
      this.paras});

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

abstract class IFunc implements IObject {
  String get name;
  IType get type;
  IParams? get paras;
  ICodeLines get lines;

  @override
  T toDObject<T extends DObject>() {
    return DFunc(
        type: type.toDObject(),
        name: name,
        lines: lines.toCodeLines(),
        paras: paras?.toDObject()) as T;
  }
}
