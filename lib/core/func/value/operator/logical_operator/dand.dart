import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/run/run_tip.dart';
import 'package:dpro/tran/tran_engine.dart';

/// it often `&&` `and`
abstract class DAnd extends DCalculate {
  static final String statementName = 'and';
  @override
  String get mapStatementName => statementName;

  static DAnd formMap(Map m) {
    assert(m['statement_name'] == statementName);
    final _left = TranEngine.formMap(m['left']);
    final _right = TranEngine.formMap(m['right']);
    return OAnd(_left, _right);
  }

  @override
  bool run(RunTip tip) =>
      getLeftExpression().run(tip) + getRightExpression().run(tip);

  @override
  OperatorEnum get operator {
    return OperatorEnum.and;
  }

  @override
  DType type = DTypes.dBool;
}

class OAnd extends DAnd {
  OAnd(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
