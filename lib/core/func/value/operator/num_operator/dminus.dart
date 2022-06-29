import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/run/run_tip.dart';

/// it often `-`
abstract class DMinus extends DCalculate {
  static final String statementName = 'minus';
  @override
  String get mapStatementName => statementName;

  // static DMinus fromMap(Map m) {
  //   assert(m['statement_name'] == statementName);
  //   final _left = TranEngine.fromMap(m['left']);
  //   final _right = TranEngine.fromMap(m['right']);
  //   return OMinus(left: _left, right: _right);
  // }

  @override
  dynamic run(RunTip tip) =>
      getLeftExpression().run(tip) - getRightExpression().run(tip);

  @override
  OperatorEnum get operator {
    return OperatorEnum.minus;
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

class OMinus extends DMinus {
  OMinus({this.left = null, this.right = null});

  @override
  DStatement? left;

  @override
  DStatement? right;
}
