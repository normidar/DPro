import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/run/run_tip.dart';
import 'package:dpro/tran/tran_engine.dart';

/// it often `>=`
abstract class DBiggerEq extends DCalculate {
  static final String statementName = 'bigger_equal';
  @override
  String get mapStatementName => statementName;

  static DBiggerEq formMap(FormMapTip f, Map m) {
    assert(m['statement_name'] == statementName);
    final _left = TranEngine.formMap(f, m['left']);
    final _right = TranEngine.formMap(f, m['right']);
    return OBiggerEq(left: _left, right: _right);
  }

  @override
  dynamic run(RunTip tip) =>
      getLeftExpression().run(tip) >= getRightExpression().run(tip);

  @override
  OperatorEnum get operator {
    return OperatorEnum.biggerEq;
  }

  @override
  DType type = DTypes.dBool;
}

class OBiggerEq extends DBiggerEq {
  OBiggerEq({this.left, this.right});

  @override
  DStatement? left;

  @override
  DStatement? right;
}
