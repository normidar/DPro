import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';

/// it often `!=` `<>`
abstract class DUnequal extends DCalculate {
  @override
  final String statementName = "unequal";

  @override
  OperatorEnum get operator {
    return OperatorEnum.unequal;
  }

  @override
  DType type = DTypes.dBool;
}

class OUnequal extends DUnequal {
  OUnequal(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
