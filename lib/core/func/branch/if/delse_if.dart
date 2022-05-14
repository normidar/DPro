import 'package:dpro/core/code_lines.dart';
import 'package:dpro/core/dstatement.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DElseIf implements DStatement {
  DStatement get condition;
  DCodeLines get lines;

  @override
  Iterable<StatementInfo> getIterable() sync* {
    yield StatementInfo(this);
    yield* condition.getIterable();
    yield* lines.getIterable();
  }

  @override
  String tran(LanguageTip tip) {
    lines.addIndent();
    final format = tip.getRule("elif");
    return sprintf(format, [
      condition.tran(tip),
      lines.tran(tip),
    ]);
  }
}

class OElseIf with DElseIf {
  @override
  DStatement condition;
  @override
  DCodeLines lines;

  OElseIf({required this.condition, required this.lines});
}
