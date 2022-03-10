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

  static DCal dBigger = DCal(DCalStrs.dBigger);
  static DCal dBiggerEq = DCal(DCalStrs.dBiggerEq);
  static DCal dEqual = DCal(DCalStrs.dEqual);
  static DCal dUnEqual = DCal(DCalStrs.dUnEqual);
  static DCal dSmaller = DCal(DCalStrs.dSmaller);
  static DCal dSmallerEq = DCal(DCalStrs.dSmallerEq);
}

class DCalStrs {
  static String dPlus = "+";
  static String dMinus = "-";
  static String dTimes = "*";
  static String dDivide = "/";
  static String dLeave = "%";

  static String dBigger = ">";
  static String dBiggerEq = ">=";
  static String dEqual = "==";
  static String dUnEqual = "!=";
  static String dSmaller = "<";
  static String dSmallerEq = "<=";
}
