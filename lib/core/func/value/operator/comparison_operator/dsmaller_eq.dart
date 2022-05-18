import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';

/// it often `<=`
abstract class DSmallerEq extends DCalculate {
  @override
  final String statementName = "smaller_equal";

  @override
  OperatorEnum get operator {
    return OperatorEnum.smallerEq;
  }

  @override
  DType type = DTypes.dBool;
}

class OSmallerEq extends DSmallerEq {
  OSmallerEq(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
