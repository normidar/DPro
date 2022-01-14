import 'package:auto_exporter/auto_exporter.dart';
import 'package:dpro/core/dobject.dart';
import 'package:dpro/core/func/value/value.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

@AutoExporter()
class DMap extends Value {
  DType? keyType;
  DType? valueType;
  Map<DObject, DObject> map;
  DMap({this.keyType, this.valueType, required this.map});
  @override
  String tran(LanguageTip tip) {
    final format = tip.ruleMap()["map"]!;
    return sprintf(format, [
      _keyValuesType(tip),
      _keyValuesString(tip),
    ]);
  }

  String _keyValuesType(LanguageTip tip) {
    DType? _keyType = keyType;
    DType? _valueType = valueType;
    if (_keyType == null || _valueType == null) {
      return "";
    }
    final format = tip.ruleMap()["map_kv"]!;
    return sprintf(format, [
      _keyType.tran(tip),
      _valueType.tran(tip),
    ]);
  }

  /// mapのアイテムのところの文字列を返す
  String _keyValuesString(LanguageTip tip) {
    final mapKvWrapFormat = tip.ruleMap()["map_kv_wrap"]!;
    final mapItemsIntervalFormat = tip.ruleMap()["map_items_interval"]!;
    final itemList = <String>[];
    map.forEach((key, value) {
      itemList.add(sprintf(mapKvWrapFormat, [key.tran(tip), value.tran(tip)]));
    });
    return itemList.join(mapItemsIntervalFormat);
  }
}
