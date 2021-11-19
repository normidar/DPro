import 'package:cli/core/code_lines.dart';
import 'package:cli/core/dobject.dart';
import 'package:cli/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

class DIf extends DObject {
  DObject condition;
  CodeLines lines;
  DIf({required this.condition, required this.lines});

  @override
  String tran(LanguageTip tip) {
    final format = tip.ruleMap()["if"]!;
    return sprintf(format, [
      condition.tran(tip),
      lines.tran(tip),
    ]);
  }
}
