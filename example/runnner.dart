import 'package:dpro/dpro.dart';
import 'my_codelines.dart' as cdls;

void main(List<String> arguments) {
  engineTest();
}

void engineTest() {
  TranEngine.tip = LanguageTips.java;
  print(TranEngine.tran(
    codes: cdls.sampleFunc(),
  ));
}
