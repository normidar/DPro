import 'package:dpro/core/code_lines.dart';
import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/class/method/dargument.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DMethod implements DStatement {
  bool get isStatic;
  bool get isPrivate;
  bool get isConstruct;
  String get name;
  DType get type;

  List<DArgument> get arguments;
  DCodeLines get lines;

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

class OMethod with DMethod {
  @override
  bool isStatic;
  @override
  bool isPrivate;
  @override
  bool isConstruct;
  @override
  String name;
  @override
  List<DArgument> arguments;
  @override
  DCodeLines lines;
  @override
  DType type;

  OMethod({
    required this.name,
    required this.lines,
    this.type = DTypes.dVoid,
    this.arguments = const [],
    this.isStatic = false,
    this.isPrivate = false,
    this.isConstruct = false,
  });
}
