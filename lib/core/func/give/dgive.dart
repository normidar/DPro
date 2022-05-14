// 値を与える　：＝
import 'package:dpro/core/func/daction.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

import '../../dstatement.dart';

abstract class DGive implements DAction {
  DStatement get target;
  DStatement get content;

  @override
  Iterable<StatementInfo> getIterable() sync* {
    yield StatementInfo(this);
    yield* target.getIterable();
    yield* content.getIterable();
  }

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("give");
    return sprintf(format, [
      target.tran(tip),
      content.tran(tip),
    ]);
  }
}

class OGive with DGive {
  @override
  DStatement target;
  @override
  DStatement content;
  OGive({required this.target, required this.content});
}
