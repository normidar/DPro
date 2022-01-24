import 'package:dpro/core/dobject.dart';
import 'package:dpro/core/func/value/constant/dconstant.dart';
import 'package:dpro/core/func/value/dvalue.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DList implements DValue {
  DType get type;
  List<DObject> get values;
  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("list");
    final _values = values.map((v) => v.tran(tip)).toList();
    return sprintf(format, [
      type.tran(tip),
      _values.join(", "),
    ]);
  }
}

class OList with DList {
  @override
  DType type;
  @override
  List<DObject> values;
  OList({required this.type, required this.values});
}
