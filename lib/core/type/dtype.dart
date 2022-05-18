import 'package:dpro/core/dstatement.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

class DType implements DStatement {
  final String type;
  final List<DType> generics;
  const DType(this.type, {this.generics = const []});

  @override
  String get statementName => "type_" + type;

  @override
  Iterable<StatementInfo> getIterable() sync* {
    yield StatementInfo(this, isFinal: generics.isEmpty);
    for (var element in generics) {
      yield* element.getIterable();
    }
  }

  @override
  String tran(LanguageTip tip) {
    String _type = tip.getType(type) ?? type;
    if (generics.isEmpty || tip.toString() != "java") {
      return _type;
    }
    // 総称がある時に
    String format = tip.getRule("generic");
    List<String> _generics = generics.map((e) => e.tran(tip)).toList();
    return sprintf(format, [
      _type,
      _generics.join(", "),
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (other is DType) {
      return type == other.type;
    }
    return super == other;
  }

  @override
  int get hashCode => type.hashCode;
}
