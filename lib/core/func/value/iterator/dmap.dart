import 'package:dpro/core/dobject.dart';
import 'package:dpro/core/func/value/constant/dconstant.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DMap implements DConstant {
  DType get keyType;
  DType get valueType;
  Map<DStatement, DStatement> get map;
  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("map");
    return sprintf(format, [
      _keyValuesType(tip),
      _keyValuesString(tip),
    ]);
  }

  String _keyValuesType(LanguageTip tip) {
    DType? _keyType = keyType;
    DType? _valueType = valueType;
    final format = tip.getRule("map_kv");
    return sprintf(format, [
      _keyType.tran(tip),
      _valueType.tran(tip),
    ]);
  }

  /// mapのアイテムのところの文字列を返す
  String _keyValuesString(LanguageTip tip) {
    final mapKvWrapFormat = tip.getRule("map_kv_wrap");
    final mapItemsIntervalFormat = tip.getRule("map_items_interval");
    final itemList = <String>[];
    map.forEach((key, value) {
      itemList.add(sprintf(mapKvWrapFormat, [key.tran(tip), value.tran(tip)]));
    });
    return itemList.join(mapItemsIntervalFormat);
  }

  @override
  DType get type {
    return DType(DTypeStrs.dMap, generics: [keyType, valueType]);
  }
}

class OMap with DMap {
  @override
  DType keyType;
  @override
  DType valueType;
  @override
  Map<DStatement, DStatement> map;
  OMap({required this.keyType, required this.valueType, required this.map});
}
