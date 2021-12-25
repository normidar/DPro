import 'package:cli/core/code_lines.dart';
import 'package:cli/core/dobject.dart';
import 'package:cli/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

class DForE extends DObject {
  String type;
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
    String _type = tip.typeMap()[type] ?? type;
    return sprintf(format, [
      _type,
      varName,
      list.tran(tip),
      lines.tran(tip),
      " " * tip.indent,
    ]);
  }
}
