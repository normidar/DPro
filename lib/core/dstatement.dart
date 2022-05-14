import '../tran/lang_tips/language_tip.dart';

/// everything is Statement
abstract class DStatement {
  /// transform to target code, the target information is in the tip
  String tran(LanguageTip tip);

  /// get iterable to for each statements, each statement will yield itself first
  Iterable<StatementInfo> getIterable();
}

class StatementInfo {
  final DStatement statement;
  final bool isFinal;
  StatementInfo(this.statement, {this.isFinal = false});
}
