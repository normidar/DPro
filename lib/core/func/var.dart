import 'package:dpro/tran/lang_tips/language_tip.dart';

import '../dstatement.dart';

// TODO: change to Exception, this should not in define.
abstract class DVar implements DStatement {
  String get name;

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
