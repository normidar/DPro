enum OperatorEnum {
  plus,
  minus,
  times,
  divide,
  bigger,
  smaller,
  biggerEq,
  smallerEq,
  equal,
  unequal,
  strLink,
}

extension ParseToString on OperatorEnum {
  String get sign {
    return toString().split('.').last;
  }
}
