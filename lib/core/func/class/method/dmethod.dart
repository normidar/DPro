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
    final format = tip.getRule("method");
    return sprintf(format, [
      getHeadString(tip),
      getArgsString(tip),
      lines.tran(tip),
      " " * tip.indent,
    ]);
  }

  String getHeadString(LanguageTip tip) {
    String rt = "";
    if (!isConstruct) {
      if (isStatic) rt += tip.getKeyword("static") + " ";
      if (isPrivate) rt += tip.getKeyword("private") + " ";
      rt += type.tran(tip) + " ";
    }
    rt += name;
    return rt;
  }

  String getArgsString(LanguageTip tip) {
    String rt = arguments.map((e) => e.tran(tip)).join(", ");
    return rt;
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
