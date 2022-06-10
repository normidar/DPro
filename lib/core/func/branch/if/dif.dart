import 'package:dpro/core/code_lines.dart';
import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/dexpression.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DIf implements DStatement {
  DExpression? get condition;
  DCodeLines get lines;
  DCodeLines? get elseLines;

  @override
  final String statementName = 'if';

  @override
  Map toMap() {
    return {
      'statement_name': statementName,
      'condition': condition?.toMap(),
      'lines': lines.toMap(),
      'else_lines': elseLines?.toMap(),
    };
  }

  @override
  Iterable<StatementInfo> getIterable() sync* {
    yield StatementInfo(this);
    if (condition != null) {
      yield* lines.getIterable();
    }
    final _elseLines = elseLines;
    if (_elseLines != null) {
      yield* _elseLines.getIterable();
    }
  }

  @override
  String tran(LanguageTip tip) {
    String _lineString;
    lines.addIndent();
    final _elseLines = elseLines;
    if (_elseLines == null) {
      _lineString = lines.tran(tip);
    } else {
      _lineString = lines.tran(tip);
      _lineString += '\n' + ' ' * tip.indent + tip.getRule('else') + '\n';
      _elseLines.addIndent();
      _lineString += _elseLines.tran(tip);
    }
    final format = tip.getRule('if');
    // TODO: to throw a warning when condition is null
    return sprintf(format, [
      condition?.tran(tip) ?? 'null',
      _lineString,
      ' ' * tip.indent,
    ]);
  }
}

class OIf with DIf {
  @override
  DExpression? condition;
  @override
  DCodeLines lines;
  @override
  DCodeLines? elseLines;
  OIf({required this.condition, required this.lines, this.elseLines});
}
