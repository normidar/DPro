import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/dexpression.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DSearch implements DExpression {
  DExpression get iterator;
  DStatement get index;
  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("search");
    return sprintf(format, [
      iterator.tran(tip),
      index.tran(tip),
    ]);
  }

  @override
  DType get type => iterator.type.generics.last;
}

class OSearch with DSearch {
  @override
  DExpression iterator;
  @override
  DStatement index;
  OSearch({required this.iterator, required this.index});
}
