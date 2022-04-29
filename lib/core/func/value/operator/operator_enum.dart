enum OperatorEnum {
  power,
  plus,
  minus,
  times,
  divide,
  // --
  bigger,
  smaller,
  biggerEq,
  smallerEq,
  equal,
  unequal,
  strLink,
  // --
  and,
  or,
}

extension ParseToString on OperatorEnum {
  String get sign {
    return toString().split('.').last;
  }
}
