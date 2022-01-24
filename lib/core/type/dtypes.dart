import 'package:dpro/core/type/dtype.dart';

class DTypes {
  static DType dStr = DType(DTypeStr.dStr);
  static DType dChar = DType(DTypeStr.dChar);
  static DType dInt = DType(DTypeStr.dInt);
  static DType dFloat = DType(DTypeStr.dFloat);
  static DType dDouble = DType(DTypeStr.dDouble);
  static DType dBool = DType(DTypeStr.dBool);
  static DType dVoid = DType(DTypeStr.dVoid);
  static DType dList = DType(DTypeStr.dList);
  static DType dMap = DType(DTypeStr.dMap);
}

class DTypeStr {
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
