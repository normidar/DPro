import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';

abstract class DTimes extends DCalculate {
  @override
  OperatorEnum get operator {
    return OperatorEnum.times;
  }
}

class OTimes extends DTimes {
  OTimes(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
