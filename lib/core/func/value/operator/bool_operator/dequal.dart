import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';

abstract class DEqual extends DCalculate {
  @override
  OperatorEnum get operator {
    return OperatorEnum.equal;
  }
}

class OEqual extends DEqual {
  OEqual(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
