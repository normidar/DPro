import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/run/run_tip.dart';

/// it often `>=`
abstract class DBiggerEq extends DCalculate {
  static final String statementName = 'bigger_equal';
  @override
  String get mapStatementName => statementName;

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
  OBiggerEq(this.left, this.right);

  @override
  DStatement left;

  @override
  DStatement right;
}
