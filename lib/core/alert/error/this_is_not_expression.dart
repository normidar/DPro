import 'package:dpro/core/alert/error/deception.dart';

/// The error to tell you your program has empty child or children.
class ThisIsNotExpression extends DError {
  @override
  String getErrorMessage() {
    return "This is not a expression";
  }
}
