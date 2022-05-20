import 'package:dpro/core/code_lines.dart';
import 'package:dpro/run/run_tip.dart';

class RunEngine {
  RunEngine({this.enableDartOutput = true});

  /// if true and no tip gived it will auto create a dart print listener
  bool enableDartOutput;
  Future run(DCodeLines codes, {RunTip? tip}) async {
    final _tip = tip ?? RunTip();
    codes.run(_tip);
  }
}
