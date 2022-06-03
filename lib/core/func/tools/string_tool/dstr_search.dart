// import 'package:dpro/core/dstatement.dart';
// import 'package:dpro/core/func/value/constant/dstring.dart';
// import 'package:dpro/core/func/value/dexpression.dart';
// import 'package:dpro/core/type/dtype.dart';
// import 'package:dpro/core/type/dtypes.dart';
// import 'package:dpro/run/run_tip.dart';
// import 'package:dpro/tran/lang_tips/language_tip.dart';
// import 'package:sprintf/sprintf.dart';

// /// use a key to search in str(it will return int, when cant find it will return -1)
// abstract class DStrSearch implements DExpression {
//   DString get str;
//   DString get key;

//   @override
//   final String statementName = "str_search";

//   @override
//   dynamic run(RunTip tip) => str.run(tip).indexOf(key.run(tip));

//   @override
//   Iterable<StatementInfo> getIterable() sync* {
//     yield StatementInfo(this);
//     yield* str.getIterable();
//     yield* key.getIterable();
//   }

//   @override
//   String tran(LanguageTip tip) {
//     final format = tip.getRule("str_search");
//     return sprintf(format, [str, key]);
//   }

//   @override
//   DType type = DTypes.dInt;
// }

// class OStrSearch with DStrSearch {
//   @override
//   DString str;
//   @override
//   DString key;
//   OStrSearch({required this.str, required this.key});
// }
