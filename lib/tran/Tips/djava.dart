import 'language_tip.dart';

class DJava extends LanguageTip {
  @override
  Map<String, String> ruleMap() {
    return {
      "def": "%s %s",
      "def_give": "%s %s = %s;",
      "give": "%s = %s;",
      "cal": "%s %s %s",
      "str": '"%s"',
      "list": "new ArrayList<%s>(Arrays.asList(%s))",
      "list_search": "%s.get(%s)",
      "list_reset": "%s.put(%s, %s);",
      // map の定数作成
      "map": "new HashMap<%s>(){{%s}}",
      "map_kv": "%s, %s",
      "map_kv_wrap": "put(%s, %s);",
      "map_items_interval": "",
      "map_search": "%s.get(%s)",
      "map_reset": "%s.put(%s, %s);",
      "generic": "%s<%s>",
      // 条件、コード、インデント
      "if": "if (%s) {\n%s\n%s}",
      "elif": "} else if (%s) {\n%s",
      "else": "} else {",
      "while": "while (%s) {\n%s\n%s}",
      "print": 'Log.d("log",%s);',
      // 始まり、終わり、ステップ、コード、インデント、変数名
      "fori": "for (int %6\$s = %s;%6\$s < %s;%6\$s += %s) {\n%s\n%s}",
      // タイプ、変数名、リストネーム、コード、インデント
      "foreach": "for (%s %s : %s) {\n%s\n%s}",
      // タイプ、ネーム、パラメータ、コード、インデント
      "func": "%s %s(%s){\n%s\n%s}",
      "para": "%s %s",
      // ネーム、コード、インデント
      "class": "class %s {\n%s\n%s}"
    };
  }

  @override
  Map<String, String> typeMap() {
    return {
      "str": "String",
      "list": "List",
      "map": "Map",
    };
  }

  @override
  String toString() {
    return "java";
  }
}
