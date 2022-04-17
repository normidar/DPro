import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';

abstract class DBigger extends DCalculate {
  @override
  OperatorEnum get operator {
    return OperatorEnum.bigger;
  }
}

class OBigger extends DBigger {
  OBigger(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
