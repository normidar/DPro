import 'package:dpro/core/code_lines.dart';
import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/branch/class/dconstrutor.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DClass implements DStatement {
  String get name;
  DCodeLines get lines;
  DConstructor? get constructor;

  @override
  String tran(LanguageTip tip) {
    lines.addIndent();
    final format = tip.getRule("class");
    return sprintf(format, [
      name,
      lines.tran(tip),
      " " * tip.indent,
    ]);
  }
}

class OClass with DClass {
  @override
  String name;
  @override
  DCodeLines lines;

  @override
  DConstructor? constructor;
  OClass({
    required this.name,
    required this.lines,
    this.constructor,
  });
}
