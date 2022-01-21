import 'package:dpro/core/dobject.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DReturn implements DObject {
  DObject get value;

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("return");
    return sprintf(format, [
      value.tran(tip),
    ]);
  }
}

class OReturn with DReturn {
  @override
  DObject value;

  OReturn({required this.value});
}
