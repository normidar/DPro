import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';

/// it often `<`
abstract class DSmaller extends DCalculate {
  @override
  final String statementName = "smaller";

  @override
  OperatorEnum get operator {
    return OperatorEnum.smaller;
  }

  @override
  DType type = DTypes.dBool;
}

class OSmaller extends DSmaller {
  OSmaller(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
