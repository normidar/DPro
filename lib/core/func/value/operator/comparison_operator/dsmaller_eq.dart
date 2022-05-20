import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/run/run_tip.dart';

/// it often `<=`
abstract class DSmallerEq extends DCalculate {
  @override
  final String statementName = "smaller_equal";

  @override
  dynamic run(RunTip tip) =>
      getLeftExpression().run(tip) <= getRightExpression().run(tip);

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
