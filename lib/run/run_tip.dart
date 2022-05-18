import 'dart:collection';

import 'package:dpro/core/type/dtype.dart';

class RunTip {
  /// to simulate the memory with the map
  RunTimeMemory runTimeMemory = RunTimeMemory();

  final List<Function(String)> _outputListeners = [];

  /// add a output listener
  void addOutputListener(Function(String) listener) {
    _outputListeners.add(listener);
  }
}

class RunTimeMemory {
  final Queue<Map<String, MemorySpace>> _memory = Queue.from([{}]);
  void enter() {
    _memory.addFirst({});
  }

  /// alert this, dont exit all queue
  void exit() {
    _memory.removeFirst();
  }

  MemorySpace? readMemorySpace(String name) {
    for (var e in _memory) {
      final ms = e[name];
      if (ms != null) {
        return ms;
      }
    }
    return null;
  }
}

class MemorySpace {
  MemorySpace(this.value, this.type);
  dynamic value;
  DType type;
}
