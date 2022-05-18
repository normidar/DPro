import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';

/// it often `&&` `and`
abstract class DAnd extends DCalculate {
  @override
  final String statementName = "and";

  @override
  OperatorEnum get operator {
    return OperatorEnum.and;
  }

  @override
  DType type = DTypes.dBool;
}

class OAnd extends DAnd {
  OAnd(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
