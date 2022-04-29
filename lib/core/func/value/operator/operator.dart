import 'package:dpro/core/alert/error/this_is_not_expression.dart';
import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/dexpression.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

/// two elements operator
abstract class DCalculate implements DExpression {
  OperatorEnum get operator;
  // why we use DStatement? because we should throw the exception to the user,
  // we should not let user lose free
  DStatement get left;
  DStatement get right;

  // 包まれた式に変えられる場合もある
  bool isPriority = false;

  OperatorInfo getOpInfo(LanguageTip tip) => tip.getOperatorInfo(operator.sign);

  /// 実際の出力時に使われる記号, ocamlの時にはoverrideした方が良い
  String getOperatorSign(LanguageTip tip) => getOpInfo(tip).sign;

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
    OperatorInfo operatorInfo = getOpInfo(tip);
    final leftExp = getLeftExpression();
    final rightExp = getRightExpression();
    // 括弧が要るかどうかをチェック
    if (rightExp is DCalculate) {
      if (rightExp.getOpInfo(tip).preceding < operatorInfo.preceding) {
        rightExp.isPriority = true;
      } else if (rightExp.getOpInfo(tip).preceding == operatorInfo.preceding &&
          operatorInfo.fixity == Fixity.left) {
        // 優先度同じかつ左結合
        rightExp.isPriority = true;
      }
    }
    if (leftExp is DCalculate) {
      if (leftExp.getOpInfo(tip).preceding < operatorInfo.preceding) {
        leftExp.isPriority = true;
      } else if (leftExp.getOpInfo(tip).preceding == operatorInfo.preceding &&
          operatorInfo.fixity == Fixity.right) {
        leftExp.isPriority = true;
      }
    }

    if (isPriority) {
      format = "($format)";
    }
    return sprintf(format, [
      getLeftExpression().tran(tip),
      getOperatorSign(tip),
      getRightExpression().tran(tip),
    ]);
  }
}
