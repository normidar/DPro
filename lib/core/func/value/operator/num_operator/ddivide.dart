import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/run/run_tip.dart';

/// it often `/`
abstract class DDivide extends DCalculate {
  static final String statementName = 'divide';
  @override
  String get mapStatementName => statementName;

  @override
  dynamic run(RunTip tip) =>
      getLeftExpression().run(tip) / getRightExpression().run(tip);

  @override
  OperatorEnum get operator {
    return OperatorEnum.divide;
  }

  @override
  DType get type {
    if (getLeftExpression().type == DTypes.dInt &&
        getRightExpression().type == DTypes.dInt) {
      return DTypes.dInt;
    }
    return DTypes.dFloat;
  }
}

class ODivide extends DDivide {
  ODivide(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
