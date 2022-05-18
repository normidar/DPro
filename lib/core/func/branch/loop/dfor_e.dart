import 'package:dpro/core/code_lines.dart';
import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DForE implements DStatement {
  DType get type;
  DStatement get list;
  DCodeLines get lines;
  String get varName;

  @override
  final String statementName = "for_each";

  @override
  Iterable<StatementInfo> getIterable() sync* {
    yield StatementInfo(this);
    yield* list.getIterable();
    yield* lines.getIterable();
  }

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
  DStatement list;
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
