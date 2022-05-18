import 'package:dpro/core/code_lines.dart';
import 'package:dpro/core/dstatement.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DIf implements DStatement {
  DStatement get condition;
  DCodeLines get lines;
  DCodeLines? get elseLines;

  @override
  final String statementName = "if";

  @override
  Iterable<StatementInfo> getIterable() sync* {
    yield StatementInfo(this);
    yield* condition.getIterable();
    yield* lines.getIterable();
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
      _lineString += "\n" + " " * tip.indent + tip.getRule("else") + "\n";
      _elseLines.addIndent();
      _lineString += _elseLines.tran(tip);
    }
    final format = tip.getRule("if");
    return sprintf(format, [
      condition.tran(tip),
      _lineString,
      " " * tip.indent,
    ]);
  }
}

class OIf with DIf {
  @override
  DStatement condition;
  @override
  DCodeLines lines;
  @override
  DCodeLines? elseLines;
  OIf({required this.condition, required this.lines, this.elseLines});
}
