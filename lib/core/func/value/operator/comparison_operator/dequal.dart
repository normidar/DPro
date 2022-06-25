import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/run/run_tip.dart';
import 'package:dpro/tran/tran_engine.dart';

/// it often `==`
abstract class DEqual extends DCalculate {
  static final String statementName = 'equal';
  @override
  String get mapStatementName => statementName;

  static DEqual formMap(FormMapTip f, Map m) {
    assert(m['statement_name'] == statementName);
    final _left = TranEngine.formMap(f, m['left']);
    final _right = TranEngine.formMap(f, m['right']);
    return OEqual(left: _left, right: _right);
  }

  @override
  dynamic run(RunTip tip) =>
      getLeftExpression().run(tip) == getRightExpression().run(tip);

  @override
  OperatorEnum get operator {
    return OperatorEnum.equal;
  }

  @override
  DType type = DTypes.dBool;
}

class OEqual extends DEqual {
  OEqual({this.left, this.right});

  @override
  DStatement? left;

  @override
  DStatement? right;
}
