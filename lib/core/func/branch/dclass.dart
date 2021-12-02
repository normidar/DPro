import 'package:cli/core/code_lines.dart';
import 'package:cli/core/dobject.dart';
import 'package:cli/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

class DClass extends DObject {
  String name;
  CodeLines lines;
  DClass({required this.name, required this.lines});

  @override
  String tran(LanguageTip tip) {
    lines.addIndent();
    final format = tip.ruleMap()["if"]!;
    return sprintf(format, [
      // condition.tran(tip),
      // lines.tran(tip),
      // " " * tip.indent,
    ]);
  }
}
