class RunTip {
  /// to simulate the memory with the map
  Map<String, dynamic> runTimeMemory = {};

  final List<Function(String)> _outputListeners = [];

  /// add a output listener
  void addOutputListener(Function(String) listener) {
    _outputListeners.add(listener);
  }
}
