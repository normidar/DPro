import 'package:dpro/core/type/dtype.dart';

class DTypes {
  static const DType dStr = DType(DTypeStrs.dStr);
  static const DType dChar = DType(DTypeStrs.dChar);
  static const DType dInt = DType(DTypeStrs.dInt);
  static const DType dFloat = DType(DTypeStrs.dFloat);
  // static DType dDouble = DType(DTypeStrs.dDouble); // 前期はDouble要らない
  static const DType dBool = DType(DTypeStrs.dBool);
  static const DType dVoid = DType(DTypeStrs.dVoid);
  static const DType dList = DType(DTypeStrs.dList);
  static const DType dMap = DType(DTypeStrs.dMap);
}

class DTypeStrs {
  static const String dStr = "str";
  static const String dChar = "char";
  static const String dInt = "int";
  static const String dFloat = "float";
  static const String dDouble = "double";
  static const String dBool = "bool";
  static const String dVoid = "void";
  static const String dList = "list";
  static const String dMap = "map";
}
