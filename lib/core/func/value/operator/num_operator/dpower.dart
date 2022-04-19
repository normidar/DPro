import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';

abstract class DPower extends DCalculate {
  @override
  OperatorEnum get operator {
    return OperatorEnum.power;
  }
}

class OPower extends DPower {
  OPower(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
