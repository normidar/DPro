import 'package:dpro/core/func/value/dexpression.dart';
import 'package:dpro/core/type/dtype.dart';

/// プログラムに書き込む定数値
abstract class DConstant implements DExpression {
  DType get type;
}
