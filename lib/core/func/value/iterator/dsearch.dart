import 'package:dpro/core/dobject.dart';
import 'package:dpro/core/func/value/dvalue.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DSearch implements DValue {
  DObject get iterator;
  DObject get index;
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
  DObject iterator;
  @override
  DObject index;
  OSearch({required this.iterator, required this.index});
}
