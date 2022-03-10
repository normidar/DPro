import 'package:dpro/core/alert/dalert.dart';

/// an error is told dpro cant compile it
abstract class DError extends DAlert {
  String getErrorMessage();
  @override
  String toString() {
    return getErrorMessage();
  }
}
