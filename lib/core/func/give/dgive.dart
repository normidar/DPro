// 値を与える　：＝
import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/daction.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:dpro/tran/tran_engine.dart';
import 'package:sprintf/sprintf.dart';

/// give a value to a variable
abstract class DGive implements DAction {
  DStatement? get target;
  DStatement? get content;

  static final String statementName = 'give';

  static DGive fromMap(FormMapTip f, Map m) {
    assert(m['statement_name'] == statementName);
    final _target = TranEngine.fromMap(f, m['target']);
    final _content = TranEngine.fromMap(f, m['content']);
    return OGive(target: _target, content: _content);
  }

  @override
  Map toMap() {
    return {
      'statement_name': statementName,
      'target': target?.toMap(),
      'content': content?.toMap(),
    };
  }

  @override
  Iterable<StatementInfo> getIterable() sync* {
    yield StatementInfo(this);
    if (target != null) {
      yield* target!.getIterable();
    }
    if (content != null) {
      yield* content!.getIterable();
    }
  }

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule('give');
    // TODO: Alert when target content is null
    return sprintf(format, [
      target!.tran(tip),
      content!.tran(tip),
    ]);
  }
}

class OGive with DGive {
  @override
  DStatement? target;
  @override
  DStatement? content;
  OGive({required this.target, required this.content});
}
