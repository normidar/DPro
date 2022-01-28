import 'package:dpro/core/exception/deception.dart';

class EmptyChildException extends DException {
  String parentName;
  String childName;
  EmptyChildException({required this.parentName, required this.childName});

  @override
  String getErrorMessage() {
    // TODO: implement getErrorMessage
    throw UnimplementedError();
  }
}
