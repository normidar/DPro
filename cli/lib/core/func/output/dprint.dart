import 'package:cli/core/dobject.dart';
import 'package:cli/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

class DPrint extends DObject {
  DObject context;
  DPrint(this.context);

  @override
  String tran(LanguageTip tip) {
    final format = tip.ruleMap()["print"]!;
    return sprintf(format, [
      context.tran(tip),
    ]);
  }
}
