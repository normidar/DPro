import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/dexpression.dart';

/// プログラムに書き込む定数値
abstract class DConstant implements DExpression {
  dynamic get value;

  @override
  Map toMap() {
    return {
      'statement_name': statementName,
      'value': value,
    };
  }

  @override
  Iterable<StatementInfo> getIterable() sync* {
    yield StatementInfo(this, isFinal: true);
  }
}
