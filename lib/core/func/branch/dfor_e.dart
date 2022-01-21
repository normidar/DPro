import 'package:auto_exporter/auto_exporter.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../code_lines.dart';
import '../../dobject.dart';

@AutoExporter()
abstract class DForE implements DObject {
  DType get type;
  DObject get list;
  DCodeLines get lines;
  String get varName;

  @override
  String tran(LanguageTip tip) {
    lines.addIndent();
    final format = tip.getRule("foreach");
    return sprintf(format, [
      type.tran(tip),
      varName,
      list.tran(tip),
      lines.tran(tip),
      " " * tip.indent,
    ]);
  }
}

class OForE with DForE {
  @override
  DType type;
  @override
  DObject list;
  @override
  DCodeLines lines;
  @override
  String varName;
  OForE({
    required this.type,
    required this.list,
    required this.lines,
    this.varName = "e",
  });
}
