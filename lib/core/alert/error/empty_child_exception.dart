import 'package:dpro/core/alert/error/deception.dart';

/// The error to tell you your program has empty child or children.
class EmptyChildError extends DError {
  String parentName;
  String childName;
  EmptyChildError({required this.parentName, required this.childName});

  @override
  String getErrorMessage() {
    // TODO: implement getErrorMessage
    throw UnimplementedError();
  }
}
