import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/dexpression.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DLenght implements DExpression {
  DStatement get iterator;
  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("len");
    return sprintf(format, [
      iterator.tran(tip),
    ]);
  }

  @override
  DType type = DTypes.dInt;
}

class OLenght with DLenght {
  @override
  DStatement iterator;
  OLenght({required this.iterator});
}
