import 'package:cli/core/code_lines.dart';
import 'package:cli/core/dobject.dart';
import 'package:cli/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

class DFunc extends DObject {
  String type;
  String name;
  CodeLines lines;
  DFunc({required this.type, required this.name, required this.lines});

  @override
  String tran(LanguageTip tip) {
    lines.addIndent();
    final format = tip.ruleMap()["func"]!;
    String _type = tip.typeMap()[type] ?? type;
    return sprintf(format, [
      _type,
      name,
      '',
      lines.tran(tip),
      " " * tip.indent,
    ]);
  }
}