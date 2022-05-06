import 'package:dpro/core/code_lines.dart';
import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/class/method/dmethod.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DClass implements DStatement {
  String get name;
  DCodeLines get fieldMembers;

  /// methodMembers includes constructor
  List<DMethod> get methodMembers;

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
    String rt = fieldMembers.tran(tip);
    for (var e in methodMembers) {
      rt += e.tran(tip);
    }
    return rt;
  }
}

class OClass with DClass {
  @override
  String name;
  @override
  DCodeLines fieldMembers;
  @override
  List<DMethod> methodMembers;

  OClass({
    required this.name,
    required this.fieldMembers,
    required this.methodMembers,
  });
}
