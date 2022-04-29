import 'package:dpro/core/type/dtype.dart';

class DTypes {
  static DType dStr = DType(DTypeStrs.dStr);
  static DType dChar = DType(DTypeStrs.dChar);
  static DType dInt = DType(DTypeStrs.dInt);
  static DType dFloat = DType(DTypeStrs.dFloat);
  // static DType dDouble = DType(DTypeStrs.dDouble); // 前期はDouble要らない
  static DType dBool = DType(DTypeStrs.dBool);
  static DType dVoid = DType(DTypeStrs.dVoid);
  static DType dList = DType(DTypeStrs.dList);
  static DType dMap = DType(DTypeStrs.dMap);
}

class DTypeStrs {
  static String dStr = "str";
  static String dChar = "char";
  static String dInt = "int";
  static String dFloat = "float";
  static String dDouble = "double";
  static String dBool = "bool";
  static String dVoid = "void";
  static String dList = "list";
  static String dMap = "map";
}
