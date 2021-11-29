import 'language_tip.dart';

class DPython extends LanguageTip {
  @override
  Map<String, String> ruleMap() {
    return {
      "def_give": "%2\$s:%1\$s = %3\$s",
      "give": "%s = %s",
      "cal": "%s %s %s",
      "str": '"%s"',
      "if": "if %s:\n%s",
      "print": "print(%s)",
      "fori": "for i in range(%s, %s, %s):\n%s",
      "func": "def %2\$s(%3\$s):\n%4\$s",
      "class": "class %s:\n%s",
    };
  }

  @override
  Map<String, String> typeMap() {
    return {};
  }
}
