import 'package:dpro/core/func/value/dexpression.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

/// form string to number(Float) like "1.2" -> 1.2f
abstract class DStrToNum implements DExpression {
  String get str;

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("str_to_num");
    return sprintf(format, [str]);
  }

  @override
  DType type = DTypes.dFloat;
}

class OStrToNum with DStrToNum {
  @override
  String str;
  OStrToNum(this.str);
}
