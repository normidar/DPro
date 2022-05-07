import 'package:dpro/core/code_lines.dart';
import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/class/dfield.dart';
import 'package:dpro/core/func/class/method/dmethod.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DClass implements DStatement {
  String get name;
  DCodeLines<DField> get fieldMembers;

  /// methodMembers includes constructor
  DCodeLines<DMethod> get methodMembers;

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("class");
    return sprintf(format, [
      name,
      _getContextString(tip),
      " " * tip.indent,
    ]);
  }

  String _getContextString(LanguageTip tip) {
    fieldMembers.addIndent();
    String rt = fieldMembers.tran(tip) + "\n";

    // codelines will auto delete the indent after tran.
    methodMembers.addIndent();
    rt += methodMembers.tran(tip);
    return rt;
  }
}

class OClass with DClass {
  @override
  String name;
  @override
  DCodeLines<DField> fieldMembers;
  @override
  DCodeLines<DMethod> methodMembers;

  OClass({
    required this.name,
    required this.fieldMembers,
    required this.methodMembers,
  });
}
