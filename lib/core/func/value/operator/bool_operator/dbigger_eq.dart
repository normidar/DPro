import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';

abstract class DBiggerEq extends DCalculate {
  @override
  OperatorEnum get operator {
    return OperatorEnum.biggerEq;
  }
}

class OBiggerEq extends DBiggerEq {
  OBiggerEq(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
