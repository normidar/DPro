import 'package:dpro/core/d_runable.dart';
import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/dexpression.dart';
import 'package:dpro/run/run_tip.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

abstract class DPrint implements DStatement, DRunable {
  DExpression get context;

  @override
  final String statementName = "print";

  @override
  dynamic run(RunTip tip) {
    tip.output(context.run(tip));
  }

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
  DExpression context;
  OPrint(this.context);
}
