import 'package:dpro/core/func/value/value.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

class DList extends Value {
  String type;
  List<Value> values;
  DList({required this.type, required this.values});
  @override
  String tran(LanguageTip tip) {
    final format = tip.ruleMap()["list"]!;
    String _type = tip.typeMap()[type] ?? type;
    final _values = values.map((v) => v.tran(tip)).toList();
    return sprintf(format, [
      _type,
      _values.join(", "),
    ]);
  }
}
