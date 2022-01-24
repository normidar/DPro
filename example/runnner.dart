import 'package:dpro/dpro.dart';
import 'my_codelines.dart' as cdls;
import 'list_to_map.dart' as ltm;

void main(List<String> arguments) {
  engineTest();
}

void engineTest() {
  TranEngine.tip = LanguageTips.java;
  print(TranEngine.tran(
    codes: ltm.listToMapFunc(),
  ));
}
