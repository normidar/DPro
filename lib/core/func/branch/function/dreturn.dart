import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/daction.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DReturn implements DAction {
  DStatement get value;

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("return");
    return sprintf(format, [
      value.tran(tip),
    ]);
  }
}

class OReturn with DReturn {
  @override
  DStatement value;

  OReturn({required this.value});
}
