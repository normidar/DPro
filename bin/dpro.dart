import 'package:dpro/cli.dart' as cli;
import 'package:dpro/export.dart';

void main(List<String> arguments) {
  TranEngine.tip = LanguageTips.python;
  print(TranEngine.tran(
    codes: cli.listToMap(),
  ));
}
