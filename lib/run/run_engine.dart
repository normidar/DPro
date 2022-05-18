import 'package:dpro/core/code_lines.dart';
import 'package:dpro/run/run_tip.dart';

class RunEngine {
  RunEngine({this.enableOutput = true});
  bool enableOutput;
  Future run(DCodeLines codes, RunTip tip) async {}
}
