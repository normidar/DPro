import 'package:cli/cli.dart' as cli;
import 'package:cli/tran/language_tips.dart';
import 'package:cli/tran/tran_engine.dart';

void main(List<String> arguments) {
  TranEngine.tip = LanguageTips.python;
  print(TranEngine.tran(
    codes: cli.sampleIf(),
  ));
}
