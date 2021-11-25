import 'package:cli/tran/Tips/language_tip.dart';

import 'dobject.dart';

class CodeLines {
  List<DObject> objects;
  CodeLines({required this.objects});
  String tran(LanguageTip tip) {
    String rt = "";
    for (var i = 0; i < objects.length; i++) {
      if (i == objects.length - 1) {
        rt += objects[i].tran(tip);
        break;
      }
      rt += objects[i].tran(tip) + "\n";
    }
    return rt;
  }
}
