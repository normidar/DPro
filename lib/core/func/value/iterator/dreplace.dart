import 'package:auto_exporter/auto_exporter.dart';
import 'package:dpro/core/dobject.dart';
import 'package:dpro/core/func/value/value.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

@AutoExporter()
abstract class DReplace implements Value {
  DObject get iterator;
  DObject get index;
  DObject get value;
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

class OReplace with DReplace {
  @override
  DObject iterator;
  @override
  DObject index;
  @override
  DObject value;
  OReplace({required this.iterator, required this.index, required this.value});
}
