import 'package:dpro/core/func/value/dint.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../code_lines.dart';
import '../../dobject.dart';

class DForI extends DObject {
  late DObject begin;
  DObject end;
  late DObject step;
  CodeLines lines;
  String varName;
  DForI({
    DObject? begin,
    required this.end,
    DObject? step,
    required this.lines,
    this.varName = "i",
  }) {
    this.begin = begin ?? DInt(0);
    this.step = step ?? DInt(1);
  }

  @override
  String tran(LanguageTip tip) {
    lines.addIndent();
    final format = tip.ruleMap()["fori"]!;
    return sprintf(format, [
      begin.tran(tip),
      end.tran(tip),
      step.tran(tip),
      lines.tran(tip),
      " " * tip.indent,
      varName,
    ]);
  }
}
