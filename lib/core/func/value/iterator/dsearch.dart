import 'package:auto_exporter/auto_exporter.dart';
import 'package:dpro/core/dobject.dart';
import 'package:dpro/core/func/value/value.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

@AutoExporter()
class DSearch extends Value {
  DObject iterator;
  DObject index;
  DSearch({required this.iterator, required this.index});
  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("search");
    return sprintf(format, [
      iterator.tran(tip),
      index.tran(tip),
    ]);
  }
}
