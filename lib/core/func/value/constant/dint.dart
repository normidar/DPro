import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';

import 'dconstant.dart';

abstract class DInt implements DConstant {
  int get value;

  @override
  String tran(LanguageTip tip) {
    return value.toString();
  }

  @override
  final DType type = DTypes.dInt;
}

class OInt with DInt {
  @override
  int value;
  OInt(this.value);
}
