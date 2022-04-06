import 'package:dpro/core/alert/dalert.dart';
import 'package:dpro/core/type/dtype.dart';

class TypeError extends DAlert {
  DType cantUseType;
  String dobj;
  TypeError(this.dobj, this.cantUseType);

  @override
  String toString() => "you can't use type " + cantUseType.type + " in " + dobj;
}
