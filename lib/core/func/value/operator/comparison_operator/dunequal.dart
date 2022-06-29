import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/run/run_tip.dart';
import 'package:dpro/tran/tran_engine.dart';

/// it often `!=` `<>`
abstract class DUnequal extends DCalculate {
  static final String statementName = 'unequal';
  @override
  String get mapStatementName => statementName;

  static DUnequal fromMap(FormMapTip f, Map m) {
    assert(m['statement_name'] == statementName);
    final _left = TranEngine.fromMap(f, m['left']);
    final _right = TranEngine.fromMap(f, m['right']);
    return OUnequal(left: _left, right: _right);
  }

  @override
  dynamic run(RunTip tip) =>
      getLeftExpression().run(tip) != getRightExpression().run(tip);

  @override
  OperatorEnum get operator {
    return OperatorEnum.unequal;
  }

  @override
  DType type = DTypes.dBool;
}

class OUnequal extends DUnequal {
  OUnequal({this.left, this.right});

  @override
  DStatement? left;

  @override
  DStatement? right;
}
