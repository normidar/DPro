import 'package:auto_exporter/auto_exporter.dart';
import 'package:dpro/core/dobject.dart';
import 'package:dpro/core/func/value/value.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

@AutoExporter()
class DSearchList extends Value {
  DObject list;
  DObject index;
  DSearchList({required this.list, required this.index});
  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("list_search");
    return sprintf(format, [
      list.tran(tip),
      index.tran(tip),
    ]);
  }
}
