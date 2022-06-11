import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/run/run_tip.dart';
import 'package:dpro/tran/tran_engine.dart';

/// it often `+`
abstract class DPlus extends DCalculate {
  static final String statementName = 'plus';
  @override
  String get mapStatementName => statementName;

  static DPlus formMap(Map m) {
    assert(m['statement_name'] == statementName);
    final _left = TranEngine.formMap(m['left']);
    final _right = TranEngine.formMap(m['right']);
    return OPlus(left: _left, right: _right);
  }

  @override
  dynamic run(RunTip tip) {
    return getLeftExpression().run(tip) + getRightExpression().run(tip);
  }

  @override
  OperatorEnum get operator {
    return OperatorEnum.plus;
  }

  @override
  DType get type {
    if (getLeftExpression().type == DTypes.dInt &&
        getRightExpression().type == DTypes.dInt) {
      return DTypes.dInt;
    }
    return DTypes.dFloat;
  }
}

class OPlus extends DPlus {
  OPlus({this.left = null, this.right = null});

  @override
  DStatement? left;

  @override
  DStatement? right;
}
