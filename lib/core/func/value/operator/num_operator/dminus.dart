import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';

abstract class DMinus extends DCalculate {
  @override
  OperatorEnum get operator {
    return OperatorEnum.minus;
  }
}

class OMinus extends DMinus {
  OMinus(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
