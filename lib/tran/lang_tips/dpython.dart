// import 'language_tip.dart';

// class DPython extends LanguageTip {
//   final Map<String, String> rule = {
//     "def": "%2\$s:%1\$s",
//     "def_give": "%2\$s:%1\$s = %3\$s",
//     "give": "%s = %s",
//     "cal": "%s %s %s",
//     "str": '"%s"',
//     "float": "%s",
//     "list": "[%2\$s]",
//     "search": "%s[%s]",
//     "replace": "%s[%s] = %s",
//     "len": "len(%s)",
//     // map の定数作成
//     "map": "{%2\$s}",
//     "map_kv": "",
//     "map_kv_wrap": "%s:%s",
//     "map_items_interval": ", ",
//     "generic": "%s[%s]",
//     "if": "if %s:\n%s",
//     "elif": "elif %s:\n%s",
//     "else": "else:",
//     "print": "print(%s)",
//     "fori": "for %6\$s in range(%s, %s, %s):\n%s",
//     "fori_easy": "for %s in range(%s):\n%s",
//     // タイプ、変数名、リストネーム、コード、インデント
//     "foreach": "for %2\$s in %3\$s:\n%4\$s",
//     "func": "def %2\$s(%3\$s):\n%4\$s",
//     "constructor": "def __init__(%2\$s):\n%3\$s",
//     "para": "%2\$s",
//     "return": "return %s",
//     "class": "class %s:\n%s",
//     "new": "%s(%s)",
//     "member": "%s.%s",
//     // tools
//     "str_to_num": "float(%s)",
//     "str_search": "%s.find(%s)", // str,key
//   };

//   @override
//   String getRule(String index) {
//     return rule[index]!;
//   }

//   @override
//   Map<String, String> typeMap() {
//     return {};
//   }

//   @override
//   String toString() {
//     return "python";
//   }

//   @override
//   OperatorInfo getOperatorInfo(String index) {
//     return operatorInfoMap[index]!;
//   }

//   // https://qiita.com/tTAGUCHI/items/1dee92cd058f975ffce3#comment-c851e9266681654a0783
//   Map<String, OperatorInfo> operatorInfoMap = {
//     "^": OperatorInfo(sign: "**", preceding: 14, fixity: Fixity.right),
//     "times": OperatorInfo(sign: "*", preceding: 13, fixity: Fixity.left),
//     "divide": OperatorInfo(sign: "/", preceding: 13, fixity: Fixity.left),
//     "mod": OperatorInfo(sign: "%", preceding: 13, fixity: Fixity.left),
//     "plus": OperatorInfo(sign: "+", preceding: 12, fixity: Fixity.left),
//     "minus": OperatorInfo(sign: "-", preceding: 12, fixity: Fixity.left),
//   };
// }
