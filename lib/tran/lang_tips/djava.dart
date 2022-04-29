import 'package:dpro/core/alert/transform/dtransform_alert.dart';

import 'language_tip.dart';

class DJava extends LanguageTip {
  final Map<String, String> rule = {
    "def": "%s %s",
    "def_give": "%s %s = %s;",
    "give": "%s = %s;",
    "cal": "%s %s %s",
    "str": '"%s"',
    "float": "%sf",
    "list": "new ArrayList<%s>(Arrays.asList(%s))",
    "search": "%s.get(%s)",
    "replace": "%s.put(%s, %s);",
    "len": "%s.size()",
    // map の定数作成
    "map": "new HashMap<%s>(){{%s}}",
    "map_kv": "%s, %s",
    "map_kv_wrap": "put(%s, %s);",
    "map_items_interval": "",
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
    "constructor": "%s(%s){\n%s\n%s}",
    "para": "%s %s",
    "return": "return %s;",
    // ネーム、コード、インデント
    "class": "class %s {\n%s\n%s}",
    "new": "new %s(%s)",
    "member": "%s.%s",
    // tools
    "str_to_num": "Float.valueOf(%s)",
    "str_search": "%s.indexOf(%s)", // str,key
  };

  @override
  String getRule(String index) {
    return rule[index]!;
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

  @override
  OperatorInfo getOperatorInfo(String index) {
    return operatorInfoMap[index]!;
  }

  // https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Operators/Operator_Precedence
  Map<String, OperatorInfo> operatorInfoMap = {
    "power": OperatorInfo(sign: "**", preceding: 14, fixity: Fixity.right),
    "times": OperatorInfo(sign: "*", preceding: 13, fixity: Fixity.left),
    "divide": OperatorInfo(sign: "/", preceding: 13, fixity: Fixity.left),
    "mod": OperatorInfo(sign: "%", preceding: 13, fixity: Fixity.left),
    "plus": OperatorInfo(sign: "+", preceding: 12, fixity: Fixity.left),
    "minus": OperatorInfo(sign: "-", preceding: 12, fixity: Fixity.left),
    // 下は比較の演算子
    "bigger_eq": OperatorInfo(sign: ">=", preceding: 10, fixity: Fixity.left),
    "bigger": OperatorInfo(sign: ">", preceding: 10, fixity: Fixity.left),
    "smaller_eq": OperatorInfo(sign: "<=", preceding: 10, fixity: Fixity.left),
    "smaller": OperatorInfo(sign: "<", preceding: 10, fixity: Fixity.left),
    "equal": OperatorInfo(sign: "==", preceding: 9, fixity: Fixity.left),
    "unequal": OperatorInfo(sign: "!=", preceding: 9, fixity: Fixity.left),
    // 論理演算子
    "and": OperatorInfo(sign: "&&", preceding: 5, fixity: Fixity.left),
    "or": OperatorInfo(sign: "||", preceding: 4, fixity: Fixity.left),
  };
}
