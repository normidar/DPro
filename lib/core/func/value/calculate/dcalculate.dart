import 'package:dpro/core/dobject.dart';
import 'package:dpro/core/func/value/calculate/dcals.dart';
import 'package:dpro/core/func/value/dvalue.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DCalculate implements DExpression {
  DCal get cal;
  DStatement get left;
  DStatement get right;

  bool isPriority = false;

  @override
  String tran(LanguageTip tip) {
    String format = tip.getRule("cal");
    if (isPriority) {
      format = "($format)";
    }
    checkLeftRight();
    return sprintf(format, [
      left.tran(tip),
      cal.str,
      right.tran(tip),
    ]);
  }

  void checkLeftRight() {
    final _left = left;
    if (_left is DCalculate) {
      _left.isPriority = true;
    }
    final _right = right;
    if (_right is DCalculate) {
      _right.isPriority = true;
    }
  }
}

class OCalculate with DCalculate {
  @override
  DCal cal;
  @override
  DStatement left;
  @override
  DStatement right;
  OCalculate({required this.cal, required this.left, required this.right});
}
