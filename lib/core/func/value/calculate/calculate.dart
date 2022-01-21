import 'package:dpro/core/dobject.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';
import 'package:auto_exporter/auto_exporter.dart';

/// calculate mean calculate two value to one
@AutoExporter()
abstract class DCalculate implements DObject {
  String get calStr;
  DObject get left;
  DObject get right;

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("cal");
    return sprintf(format, [
      left.tran(tip),
      calStr,
      right.tran(tip),
    ]);
  }
}

class OCalculate with DCalculate {
  @override
  String calStr;
  @override
  DObject left;
  @override
  DObject right;
  OCalculate(this.calStr, this.left, this.right);
}
