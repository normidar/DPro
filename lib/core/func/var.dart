import 'package:dpro/core/func/value/dexpression.dart';
import 'package:dpro/core/type/dtype.dart';
import 'package:dpro/run/run_tip.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';

import '../dstatement.dart';

/// A variable
abstract class DVar implements DExpression {
  String get name;

  @override
  // TODO: find type in tip and return type
  DType? get type => null;

  @override
  String statementName = 'variable';

  @override
  dynamic run(RunTip tip) {
    return tip.runTimeMemory.readMemorySpace(name)?.value;
  }

  @override
  Map toMap() {
    return {
      'statement_name': statementName,
      'name': name,
    };
  }

  @override
  Iterable<StatementInfo> getIterable() sync* {
    yield StatementInfo(this, isFinal: true);
  }

  @override
  String tran(LanguageTip tip) {
    return name;
  }
}

class OVar with DVar {
  @override
  String name;
  OVar(this.name);
}
