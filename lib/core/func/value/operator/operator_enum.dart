enum OperatorEnum {
  plus,
  minus,
  times,
  divide,
}

extension ParseToString on OperatorEnum {
  String get sign {
    return toString().split('.').last;
  }
}
