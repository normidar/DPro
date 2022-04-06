import 'package:dpro/core/alert/dalert.dart';
import 'package:dpro/core/type/dtype.dart';

class TypeMaybeAutoChange extends DAlert {
  DType original, target;
  String dobj;
  TypeMaybeAutoChange(this.dobj, this.original, this.target);
  @override
  String toString() {
    return "on " +
        dobj +
        ", " +
        original.type +
        " will be changed to " +
        target.type;
  }
}
