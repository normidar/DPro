import 'package:dpro/core/dobject.dart';
import 'package:dpro/core/func/value/dvalue.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DSearch implements DExpression {
  DStatement get iterator;
  DStatement get index;
  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("search");
    return sprintf(format, [
      iterator.tran(tip),
      index.tran(tip),
    ]);
  }
}

class OSearch with DSearch {
  @override
  DStatement iterator;
  @override
  DStatement index;
  OSearch({required this.iterator, required this.index});
}
