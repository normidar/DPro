import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DArgument implements DStatement {
  DType get type;

  /// the name use inside the code lines
  String get insideName;

  /// like swift it has a name outside
  String? get outsideName;

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("argument");
    return sprintf(format, [
      type.tran(tip),
      insideName,
    ]);
  }
}

class OArgument with DArgument {
  @override
  DType type;

  /// the name use inside the code lines
  @override
  String insideName;

  /// like swift it has a name outside
  @override
  String? outsideName;

  OArgument({
    required this.type,
    required this.insideName,
    this.outsideName,
  });
}
