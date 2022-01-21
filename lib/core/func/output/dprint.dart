import 'package:dpro/core/dobject.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DPrint implements DObject {
  DObject get context;

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("print");
    return sprintf(format, [
      context.tran(tip),
    ]);
  }
}

class OPrint with DPrint {
  @override
  DObject context;
  OPrint(this.context);
}
