import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/dexpression.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/core/type/dtypes.dart';
import 'package:dpro/run/run_tip.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DMap implements DExpression {
  DType? get keyType;
  DType? get valueType;
  Map<DExpression, DExpression> get map;

  static final String statementName = 'map';

  @override
  dynamic run(RunTip tip) {
    var rt = {};
    for (var k in map.keys) {
      rt[k.run(tip)] = map[k.run(tip)];
    }
    return rt;
  }

  @override
  Map toMap() {
    var _map = [];
    for (var k in map.keys) {
      _map.add([k.toMap(), map[k]?.toMap()]);
    }
    return {
      'statement_name': statementName,
      'key_type': keyType?.toMap(),
      'value_type': valueType?.toMap(),
      'map': _map,
    };
  }

  @override
  Iterable<StatementInfo> getIterable() sync* {
    yield StatementInfo(this, isFinal: map.isEmpty);
    for (var k in map.keys) {
      yield* k.getIterable();
      yield* map[k]!.getIterable();
    }
  }

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule('map');
    return sprintf(format, [
      _keyValuesType(tip),
      _keyValuesString(tip),
    ]);
  }

  // TODO: check if type is null(check value and auto create the type)
  DType getKeyType() => keyType!;
  DType getValueType() => valueType!;

  String _keyValuesType(LanguageTip tip) {
    DType _keyType = getKeyType();
    DType _valueType = getValueType();
    final format = tip.getRule('map_kv');
    return sprintf(format, [
      _keyType.tran(tip),
      _valueType.tran(tip),
    ]);
  }

  /// mapのアイテムのところの文字列を返す
  String _keyValuesString(LanguageTip tip) {
    final mapKvWrapFormat = tip.getRule('map_kv_wrap');
    final mapItemsIntervalFormat = tip.getRule('map_items_interval');
    final itemList = <String>[];
    map.forEach((key, value) {
      itemList.add(sprintf(mapKvWrapFormat, [key.tran(tip), value.tran(tip)]));
    });
    return itemList.join(mapItemsIntervalFormat);
  }

  @override
  DType get type {
    return DType(DTypeStrs.dMap, generics: [getKeyType(), getValueType()]);
  }
}

class OMap with DMap {
  @override
  DType? keyType;
  @override
  DType? valueType;
  @override
  Map<DExpression, DExpression> map;
  OMap({
    required this.map,
    this.keyType,
    this.valueType,
  });
}
