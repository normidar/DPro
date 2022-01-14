import 'package:dpro/core/dobject.dart';
import 'package:dpro/core/func/value/value.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
class DMap extends Value {
  String? keyType;
  String? valueType;
  Map<DObject,DObject> map;
  DMap({this.keyType,this.valueType,required this.map});
  @override
  String tran(LanguageTip tip) {
    final mapFormat = tip.ruleMap()["map"]!;
    final mapKvFormat = tip.ruleMap()["map_kv"]!;
    

    String _type = tip.typeMap()[type] ?? type;
    final _values = values.map((v) => v.tran(tip)).toList();
    return sprintf(format, [
      _type,
      _values.join(", "),
    ]);
  }

  /// mapのアイテムのところの文字列を返す
  String _keyValuesString(LanguageTip tip){
    final mapKvWrapFormat = tip.ruleMap()["map_kv_wrap"]!;
    final mapItemsIntervalFormat = tip.ruleMap()["map_items_interval"]!;
    final itemList = <String>[];
    map.forEach((key, value) { 
      itemList.add(sprintf(mapKvWrapFormat,[
        key.tran(tip),value.tran(tip)
      ]));
    });
    return itemList.join(mapItemsIntervalFormat);
  }
}