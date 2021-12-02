import '../core/code_lines.dart';
import 'language_tips.dart';
import 'Tips/language_tip.dart';

class TranEngine {
  static LanguageTip tip = LanguageTips.dart;
  static String tran({required CodeLines codes}) {
    String rt = "";
    for (var i in codes.objects) {
      rt += i.tran(tip) + "\n";
    }
    return rt;
  }
}
