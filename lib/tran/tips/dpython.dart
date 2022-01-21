import 'language_tip.dart';

class DPython extends LanguageTip {
  final Map<String, String> _rule = {
    "def": "%2\$s:%1\$s",
    "def_give": "%2\$s:%1\$s = %3\$s",
    "give": "%s = %s",
    "cal": "%s %s %s",
    "str": '"%s"',
    "list": "[%2\$s]",
    "search": "%s[%s]",
    "replace": "%s[%s] = %s",
    // map の定数作成
    "map": "{%2\$s}",
    "map_kv": "",
    "map_kv_wrap": "%s:%s",
    "map_items_interval": ", ",
    "generic": "%s[%s]",
    "if": "if %s:\n%s",
    "elif": "elif %s:\n%s",
    "else": "else:",
    "print": "print(%s)",
    "fori": "for %6\$s in range(%s, %s, %s):\n%s",
    "fori_easy": "for %s in range(%s):\n%s",
    // タイプ、変数名、リストネーム、コード、インデント
    "foreach": "for %2\$s in %3\$s:\n%4\$s",
    "func": "def %2\$s(%3\$s):\n%4\$s",
    "constructor": "def __init__(%2\$s):\n%3\$s",
    "para": "%2\$s",
    "return": "return %s",
    "class": "class %s:\n%s",
  };

  @override
  String getRule(String index) {
    return _rule[index]!;
  }

  @override
  Map<String, String> typeMap() {
    return {};
  }

  @override
  String toString() {
    return "python";
  }
}
