import 'package:auto_exporter/auto_exporter.dart';
import 'package:dpro/core/dobject.dart';
import 'package:dpro/core/func/value/value.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

@AutoExporter()
class DReplace extends Value {
  DObject iterator;
  DObject index;
  DObject value;
  DReplace({required this.iterator, required this.index, required this.value});
  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("replace");
    return sprintf(format, [
      iterator.tran(tip),
      index.tran(tip),
      value.tran(tip),
    ]);
  }
}
