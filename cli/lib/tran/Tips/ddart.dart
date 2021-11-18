import 'language_tip.dart';

class DDart extends LanguageTip {
  @override
  Map<String, String> ruleMap() {
    return {
      "def_give": "%s %s = %s;",
      "give": "%s = %s;",
      "cal": "%s %s %s",
      "str": '"%s"',
      "if": "if (%s) {\n  %s\n}"
    };
  }

  @override
  Map<String, String> typeMap() {
    return {"str": "String"};
  }
}
