import 'package:dpro/cli.dart' as cli;
import 'package:dpro/dpro.dart';

void main(List<String> arguments) {
  engineTest();
}

void engineTest() {
  TranEngine.tip = LanguageTips.java;
  print(TranEngine.tran(
    codes: cli.sampleFunc(),
  ));
}
