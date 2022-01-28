import 'package:dpro/core/func/value/dvalue.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

/// form string to number(Float)
abstract class DStrToNum implements DValue {
  String get str;

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("str_to_num");
    return sprintf(format, [str]);
  }
}

class OStrToNum with DStrToNum {
  @override
  String str;
  OStrToNum(this.str);
}
