import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/run/run_tip.dart';
import 'package:dpro/tran/tran_engine.dart';

/// it often `*`
abstract class DTimes extends DCalculate {
  static final String statementName = 'times';

  @override
  String get mapStatementName => statementName;

  static DTimes formMap(Map m) {
    assert(m['statement_name'] == statementName);
    final _left = TranEngine.formMap(m['left']);
    final _right = TranEngine.formMap(m['right']);
    return OTimes(_left, _right);
  }

  @override
  dynamic run(RunTip tip) =>
      getLeftExpression().run(tip) * getRightExpression().run(tip);

  @override
  Map toMap() {
    return {
      'statement_name': statementName,
    };
  }

  @override
  OperatorEnum get operator {
    return OperatorEnum.times;
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

class OTimes extends DTimes {
  OTimes(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
