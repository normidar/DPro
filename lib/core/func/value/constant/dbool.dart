import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';

import 'dconstant.dart';

abstract class DBool extends DConstant {
  bool get value;

  @override
  String tran(LanguageTip tip) {
    return value.toString();
  }

  @override
  final DType type = DTypes.dBool;
}

class OBool extends DBool {
  @override
  bool value;
  OBool(this.value);
}
