import 'package:auto_exporter/auto_exporter.dart';
import 'package:dpro/core/dobject.dart';
import 'package:dpro/core/func/value/value.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

@AutoExporter()
class DResetList extends Value {
  DObject list;
  DObject index;
  DObject value;
  DResetList({required this.list, required this.index, required this.value});
  @override
  String tran(LanguageTip tip) {
    final format = tip.ruleMap()["list_reset"]!;
    return sprintf(format, [
      list.tran(tip),
      index.tran(tip),
      value.tran(tip),
    ]);
  }
}
