import 'package:dpro/core/dobject.dart';
import 'package:dpro/core/func/value/constant/dconstant.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DList implements DConstant {
  DType get valueType;
  List<DObject> get values;
  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("list");
    final _values = values.map((v) => v.tran(tip)).toList();
    return sprintf(format, [
      valueType.tran(tip),
      _values.join(", "),
    ]);
  }

  @override
  DType get type {
    return DType(DTypeStrs.dList, generics: [valueType]);
  }
}

class OList with DList {
  @override
  DType valueType;
  @override
  List<DObject> values;
  OList({required this.valueType, required this.values});
}
