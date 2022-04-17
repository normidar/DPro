import 'package:dpro/core/alert/error/this_is_not_expression.dart';
import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/dexpression.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DOperator extends DExpression {
  String get signIndex;
  // String getSign(LanguageTip tip) {}
}

abstract class DCalculate implements DExpression {
  OperatorEnum get operator;
  // why we use DStatement? because we should throw the exception to the user,
  // we should not let user lose free
  DStatement get left;
  DStatement get right;

  bool isPriority = false;

  /// 実際の出力時に使われる記号, ocamlの時にはoverrideした方が良い
  String getOperatorSign(LanguageTip tip) {
    return tip.getOperatorInfo(operator.sign).sign;
  }

  DExpression getLeftExpression() {
    if (left is DExpression) {
      return left as DExpression;
    }
    throw ThisIsNotExpression();
  }

  DExpression getRightExpression() {
    if (right is DExpression) {
      return right as DExpression;
    }
    throw ThisIsNotExpression();
  }

  @override
  String tran(LanguageTip tip) {
    String format = tip.getRule("cal");
    if (isPriority) {
      format = "($format)";
    }
    checkLeftRight();
    return sprintf(format, [
      getLeftExpression().tran(tip),
      getOperatorSign(tip),
      getRightExpression().tran(tip),
    ]);
  }

  void checkLeftRight() {
    final _left = left;
    if (_left is DCalculate) {
      _left.isPriority = true;
    }
    final _right = right;
    if (_right is DCalculate) {
      _right.isPriority = true;
    }
  }
}
