import 'language_tip.dart';

class DJava extends LanguageTip {
  @override
  Map<String, String> ruleMap() {
    return {
      "def_give": "%s %s = %s;",
      "give": "%s = %s;",
      "cal": "%s %s %s",
      "str": '"%s"',
      // 条件、コード、インデント
      "if": "if (%s) {\n%s\n%s}",
      "print": 'Log.d("log",%s);',
      // 始まり、終わり、ステップ、コード、インデント
      "fori": "for (int i = %s;i < %s;i += %s) {\n%s\n%s}",
      // タイプ、ネーム、パラメータ、コード、インデント
      "func": "%s %s(%s){\n%s\n%s}",
      // ネーム、コード、インデント
      "class": "class %s {\n%s\n%s}"
    };
  }

  @override
  Map<String, String> typeMap() {
    return {"str": "String"};
  }
}
