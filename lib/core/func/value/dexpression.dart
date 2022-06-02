import 'package:dpro/core/d_runable.dart';
import 'package:dpro/core/func/daction.dart';
import 'package:dpro/core/type/dtype.dart';

/// A DExpression is a can get value object.
/// expression allway return a value.
abstract class DExpression extends DAction implements DRunable {
  DType? get type;
}
