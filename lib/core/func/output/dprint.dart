import 'package:dpro/core/dstatement.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DPrint implements DStatement {
  DStatement get context;

  @override
  final String statementName = "print";

  @override
  Iterable<StatementInfo> getIterable() sync* {
    yield StatementInfo(this);
    yield* context.getIterable();
  }

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("print");
    return sprintf(format, [
      context.tran(tip),
    ]);
  }
}

class OPrint with DPrint {
  @override
  DStatement context;
  OPrint(this.context);
}
