import 'package:dpro/core/dobject.dart';
import 'package:dpro/core/func/value/constant/dconstant.dart';
import 'package:dpro/core/func/value/dvalue.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DLenght implements DValue {
  DObject get iterator;
  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("len");
    return sprintf(format, [
      iterator.tran(tip),
    ]);
  }
}

class OLenght with DLenght {
  @override
  DObject iterator;
  OLenght({required this.iterator});
}
