import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';

abstract class DDivide extends DCalculate {
  @override
  OperatorEnum get operator {
    return OperatorEnum.divide;
  }
}

class ODivide extends DDivide {
  ODivide(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
