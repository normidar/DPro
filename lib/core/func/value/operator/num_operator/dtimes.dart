import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';

/// it often `*`
abstract class DTimes extends DCalculate {
  @override
  final String statementName = "times";

  @override
  OperatorEnum get operator {
    return OperatorEnum.times;
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

class OTimes extends DTimes {
  OTimes(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
