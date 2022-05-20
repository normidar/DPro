import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/run/run_tip.dart';

/// it often `-`
abstract class DMinus extends DCalculate {
  @override
  final String statementName = "minus";

  @override
  dynamic run(RunTip tip) =>
      getLeftExpression().run(tip) - getRightExpression().run(tip);

  @override
  OperatorEnum get operator {
    return OperatorEnum.minus;
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

class OMinus extends DMinus {
  OMinus(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
