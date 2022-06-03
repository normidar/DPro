// import 'package:dpro/core/dstatement.dart';
// import 'package:dpro/core/func/value/dexpression.dart';
// import 'package:dpro/core/type/dtype.dart';
// import 'package:dpro/tran/lang_tips/language_tip.dart';

// /// the field of a class, it will be like define some variables
// abstract class DField implements DStatement {
//   /// get the type
//   DType get type;

//   /// the defaultValue of the field
//   DExpression? get defaultValue;
//   bool get isPrivate;
//   bool get isStatic;

//   /// if the field is final, it will can`t be changed
//   bool get isFinal;
//   String get name;

//   @override
//   final String statementName = "field";

//   @override
//   Iterable<StatementInfo> getIterable() sync* {
//     yield StatementInfo(this);
//     yield* type.getIterable();
//     final _defaultValue = defaultValue;
//     if (_defaultValue != null) {
//       yield* _defaultValue.getIterable();
//     }
//   }

//   @override
//   String tran(LanguageTip tip) {
//     // まずjavaだけを考える
//     return getFieldString(tip);
//   }

//   String getFieldString(LanguageTip tip) {
//     String rt = "";
//     if (isPrivate) rt += "private ";
//     if (isStatic) rt += "static ";
//     if (isFinal && defaultValue != null) rt += "final ";
//     rt += type.tran(tip) + " " + statementName;
//     if (defaultValue != null) rt += " = " + defaultValue!.tran(tip);
//     rt += ";";
//     return rt;
//   }
// }

// class OField with DField {
//   @override
//   DType type;
//   @override
//   DExpression? defaultValue;
//   @override
//   bool isFinal;
//   @override
//   bool isPrivate;
//   @override
//   bool isStatic;
//   @override
//   String name;

//   OField({
//     required this.type,
//     required this.name,
//     this.defaultValue,
//     this.isFinal = false,
//     this.isPrivate = false,
//     this.isStatic = false,
//   });
// }
