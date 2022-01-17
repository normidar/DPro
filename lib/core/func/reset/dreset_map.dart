import 'package:auto_exporter/auto_exporter.dart';
import 'package:dpro/core/dobject.dart';
import 'package:dpro/core/func/value/value.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

@AutoExporter()
class DResetMap extends Value {
  DObject map;
  DObject index;
  DObject value;
  DResetMap({required this.map, required this.index, required this.value});
  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("map_reset");
    return sprintf(format, [
      map.tran(tip),
      index.tran(tip),
      value.tran(tip),
    ]);
  }
}
