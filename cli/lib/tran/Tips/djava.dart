import 'language_tip.dart';

class DJava extends LanguageTip {
  @override
  Map<String, String> ruleMap() {
    return {
      "def_give": "%s %s = %s;",
      "give": "%s = %s;",
      "cal": "%s %s %s",
      "str": '"%s"',
      "if": "if (%s) {\n%s\n}",
      "print": 'Log.d("log",%s);',
      "fori": "for (int i = %s;i < %s;i += %s) {\n%s\n}",
      "func": "%s %s(%s){\n  %s\n}",
      "class": "class %s {\n%s}"
    };
  }

  @override
  Map<String, String> typeMap() {
    return {"str": "String"};
  }
}
