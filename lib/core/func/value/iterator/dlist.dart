import 'package:auto_exporter/auto_exporter.dart';
import 'package:dpro/core/dobject.dart';
import 'package:dpro/core/func/value/value.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

@AutoExporter()
class DList extends Value {
  DType type;
  List<DObject> values;
  DList({required this.type, required this.values});
  @override
  String tran(LanguageTip tip) {
    final format = tip.ruleMap()["list"]!;
    final _values = values.map((v) => v.tran(tip)).toList();
    return sprintf(format, [
      type.tran(tip),
      _values.join(", "),
    ]);
  }
}
