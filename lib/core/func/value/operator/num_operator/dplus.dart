import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';

/// it often `+`
abstract class DPlus extends DCalculate {
  @override
  final String statementName = "plus";

  @override
  OperatorEnum get operator {
    return OperatorEnum.plus;
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

class OPlus extends DPlus {
  OPlus(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
