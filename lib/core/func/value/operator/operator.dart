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

  @override
  String tran(LanguageTip tip) {
    String format = tip.getRule("cal");
    if (isPriority) {
      format = "($format)";
    }
    checkLeftRight();
    return sprintf(format, [
      left.tran(tip),
      tip.getOperatorInfo(operator.sign).sign,
      right.tran(tip),
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

class OCalculate with DCalculate {
  @override
  DStatement left;
  @override
  DStatement right;
  OCalculate({required this.left, required this.right});

  @override
  // TODO: implement operator
  OperatorEnum get operator => throw UnimplementedError();
}
