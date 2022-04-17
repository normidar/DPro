import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';

abstract class DStrLink extends DCalculate {
  @override
  OperatorEnum get operator {
    return OperatorEnum.strLink;
  }
}

class OStrLink extends DStrLink {
  OStrLink(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
