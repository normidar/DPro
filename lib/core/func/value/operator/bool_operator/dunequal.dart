import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';

abstract class DUnequal extends DCalculate {
  @override
  OperatorEnum get operator {
    return OperatorEnum.unequal;
  }
}

class OUnequal extends DUnequal {
  OUnequal(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
