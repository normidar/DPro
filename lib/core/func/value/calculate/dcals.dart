import 'package:dpro/core/func/value/calculate/dcalculate.dart';
import 'package:dpro/core/type/dtype.dart';

class DCal {
  String str;
  DCal(this.str);
}

class DCals {
  static DCal dPlus = DCal(DCalStrs.dPlus);
  static DCal dMinus = DCal(DCalStrs.dMinus);
  static DCal dTimes = DCal(DCalStrs.dTimes);
  static DCal dDivide = DCal(DCalStrs.dDivide);
  static DCal dLeave = DCal(DCalStrs.dLeave);
}

class DCalStrs {
  static String dPlus = "+";
  static String dMinus = "-";
  static String dTimes = "*";
  static String dDivide = "/";
  static String dLeave = "%";
}
