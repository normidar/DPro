import 'package:dpro/core/dstatement.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DMember implements DStatement {
  DStatement get instance;
  String get memberName;

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("member");
    return sprintf(format, [
      instance.tran(tip),
      memberName,
    ]);
  }
}

class OMember with DMember {
  @override
  DStatement instance;
  @override
  String memberName;

  OMember({
    required this.instance,
    required this.memberName,
  });
}
