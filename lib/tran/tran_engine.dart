import 'package:auto_exporter/auto_exporter.dart';

import '../core/code_lines.dart';
import 'Tips/language_tip.dart';
import 'language_tips.dart';

@AutoExporter()
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
