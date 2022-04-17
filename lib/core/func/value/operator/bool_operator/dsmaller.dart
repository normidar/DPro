import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';

abstract class DSmaller extends DCalculate {
  @override
  OperatorEnum get operator {
    return OperatorEnum.smaller;
  }
}

class OSmaller extends DSmaller {
  OSmaller(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
