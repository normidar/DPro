import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';

abstract class DStrLink extends DCalculate {
  @override
  OperatorEnum get operator {
    return OperatorEnum.strLink;
  }

  @override
  DType type = DTypes.dStr;
}

class OStrLink extends DStrLink {
  OStrLink(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
