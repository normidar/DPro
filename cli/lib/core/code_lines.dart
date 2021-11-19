import 'package:cli/tran/Tips/language_tip.dart';

import 'dobject.dart';

class CodeLines {
  List<DObject> objects;
  CodeLines({required this.objects});
  String tran(LanguageTip tip) {
    String rt = "";
    for (var i in objects) {
      rt += i.tran(tip) + "\n";
    }
    return rt;
  }
}
