import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';

abstract class DPlus extends DCalculate {
  @override
  OperatorEnum get operator {
    return OperatorEnum.plus;
  }
}

class OPlus extends DPlus {
  OPlus(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
