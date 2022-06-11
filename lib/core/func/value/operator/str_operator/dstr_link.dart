import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/run/run_tip.dart';
import 'package:dpro/tran/tran_engine.dart';

abstract class DStrLink extends DCalculate {
  static final String statementName = 'str_link';
  @override
  String get mapStatementName => statementName;

  static DStrLink formMap(Map m) {
    assert(m['statement_name'] == statementName);
    final _left = TranEngine.formMap(m['left']);
    final _right = TranEngine.formMap(m['right']);
    return OStrLink(_left, _right);
  }

  @override
  dynamic run(RunTip tip) =>
      getLeftExpression().run(tip) + getRightExpression().run(tip);

  @override
  OperatorEnum get operator {
    return OperatorEnum.strLink;
  }

  @override
  DType type = DTypes.dStr;
}

class OStrLink extends DStrLink {
  OStrLink(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
