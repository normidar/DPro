import 'package:auto_exporter/auto_exporter.dart';
import 'package:dpro/core/dobject.dart';
import 'package:dpro/core/func/value/value.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

@AutoExporter()
class DSearchMap extends Value {
  DObject map;
  DObject index;
  DSearchMap({required this.map, required this.index});
  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("map_search");
    return sprintf(format, [
      map.tran(tip),
      index.tran(tip),
    ]);
  }
}
