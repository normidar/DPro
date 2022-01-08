import 'Tips/djava.dart';
import 'Tips/dpython.dart';
import 'Tips/language_tip.dart';
import 'Tips/ddart.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
class LanguageTips {
  static LanguageTip dart = DDart();
  static LanguageTip python = DPython();
  static LanguageTip java = DJava();
  // static LanguageTip swift;
  // static LanguageTip js;

}
