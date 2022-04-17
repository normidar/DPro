import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';

abstract class DSmallerEq extends DCalculate {
  @override
  OperatorEnum get operator {
    return OperatorEnum.smallerEq;
  }
}

class OSmallerEq extends DSmallerEq {
  OSmallerEq(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
