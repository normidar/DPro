import 'package:dpro/core/code_lines.dart';
import 'package:dpro/core/dstatement.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DWhile implements DStatement {
  DStatement get condition;
  DCodeLines get lines;

  @override
  final String statementName = 'while';

  @override
  Map toMap() {
    return {
      'statement_name': statementName,
      'condition': condition.toMap(),
      'lines': lines.toMap(),
    };
  }

  @override
  Iterable<StatementInfo> getIterable() sync* {
    yield StatementInfo(this);
    yield* condition.getIterable();
    yield* lines.getIterable();
  }

  @override
  String tran(LanguageTip tip) {
    lines.addIndent();
    final format = tip.getRule('while');
    return sprintf(format, [
      condition.tran(tip),
      lines.tran(tip),
      ' ' * tip.indent,
    ]);
  }
}

class OWhile with DWhile {
  @override
  DStatement condition;
  @override
  DCodeLines lines;
  OWhile({required this.condition, required this.lines});
}
