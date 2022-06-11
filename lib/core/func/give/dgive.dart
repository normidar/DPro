// 値を与える　：＝
import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/daction.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

/// give a value to a variable
abstract class DGive implements DAction {
  DStatement get target;
  DStatement get content;

  static final String statementName = 'give';

  @override
  Map toMap() {
    return {
      'statement_name': statementName,
      'target': target.toMap(),
      'content': content.toMap(),
    };
  }

  @override
  Iterable<StatementInfo> getIterable() sync* {
    yield StatementInfo(this);
    yield* target.getIterable();
    yield* content.getIterable();
  }

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule('give');
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
