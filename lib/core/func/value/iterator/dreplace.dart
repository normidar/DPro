// import 'package:dpro/core/dstatement.dart';
// import 'package:dpro/tran/lang_tips/language_tip.dart';
// import 'package:sprintf/sprintf.dart';

// abstract class DReplace implements DStatement {
//   DStatement get iterator;
//   DStatement get index;
//   DStatement get value;

//   @override
//   final String statementName = "replace_iterator";

//   @override
//   Iterable<StatementInfo> getIterable() sync* {
//     yield StatementInfo(this);
//     yield* iterator.getIterable();
//     yield* index.getIterable();
//     yield* value.getIterable();
//   }

//   @override
//   String tran(LanguageTip tip) {
//     final format = tip.getRule("replace");
//     return sprintf(format, [
//       iterator.tran(tip),
//       index.tran(tip),
//       value.tran(tip),
//     ]);
//   }
// }

// class OReplace with DReplace {
//   @override
//   DStatement iterator;
//   @override
//   DStatement index;
//   @override
//   DStatement value;
//   OReplace({required this.iterator, required this.index, required this.value});
// }
