import 'package:dpro/dpro.dart';
import 'package:sprintf/sprintf.dart';

/// define variable
abstract class DDefVariable implements DAction, DRunable {
  // use getType() to get the type
  DType? get type;

  /// some time we should auto change the variable name
  DVar get target;
  DExpression? get content;
  bool get changeable;

  @override
  final String statementName = 'define_variable';

  @override
  dynamic run(RunTip tip) {
    final _content = content;

    if (_content != null) {
      tip.runTimeMemory.inputMemory(
        target.name,
        _content.run(tip),
        getType(),
      );
    }
  }

  @override
  Map toMap() {
    return {
      'statement_name': statementName,
      'type': type?.toMap(),
      'target': target.toMap(),
    };
  }

  @override
  Iterable<StatementInfo> getIterable() sync* {
    yield StatementInfo(this);
    // do not see type now
    yield* target.getIterable();
    final _content = content;
    if (_content != null) {
      yield* _content.getIterable();
    }
  }

  @override
  String tran(LanguageTip tip) {
    final defFormat = tip.getRule('def');
    final giveFormat = tip.getRule('give');

    var targetStr = target.tran(tip);
    // 与える時に定義するかどうかを判定
    if (tip.toString() == 'java') {
      DType _type = getType();

      targetStr = sprintf(defFormat, [_type.tran(tip), targetStr]);
    }
    // TODO: TEST
    return sprintf(giveFormat, [
      targetStr,
      content?.tran(tip),
    ]);
  }

  DType getType() {
    DType? _type = type;
    if (_type != null) return _type;
    DStatement? _content = content;
    // TODO: change to dynamic not void
    if (_content == null) return DTypes.dVoid;
    if (_content is DExpression) {
      return _content.type!;
    }
    throw Exception('this target can not support retype');
  }
}

class ODefGive with DDefVariable {
  @override
  DType? type;
  @override
  DVar target;
  @override
  DExpression? content;
  @override
  bool changeable;
  ODefGive(
      {required this.target,
      required this.content,
      this.type,
      this.changeable = true});
}
