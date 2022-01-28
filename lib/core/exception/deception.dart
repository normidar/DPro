abstract class DException implements Exception {
  String getErrorMessage();
  @override
  String toString() {
    return getErrorMessage();
  }
}
