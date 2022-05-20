import 'dart:collection';

import 'package:dpro/core/type/dtype.dart';

class RunTip {
  RunTip({this.isPrintToDart = true}) {
    if (isPrintToDart) {
      bindDartPrint();
    }
  }

  /// bind dart print or not
  bool isPrintToDart;

  /// to simulate the memory with the map
  RunTimeMemory runTimeMemory = RunTimeMemory();

  // -- about output --

  final List<Function(String)> _outputListeners = [];

  /// add a output listener
  void addOutputListener(Function(String) listener) {
    _outputListeners.add(listener);
  }

  /// clear the output listeners
  void clearOutputListeners() => _outputListeners.clear();

  /// bind the dart print to output listeners
  void bindDartPrint() {
    addOutputListener(print);
  }

  /// print some message to output listeners
  void output(dynamic message) {
    for (var e in _outputListeners) {
      e(message.toString());
    }
  }
}

class RunTimeMemory {
  final Queue<Map<String, MemorySpace>> _memory =
      Queue.from([<String, MemorySpace>{}]);
  void enter() {
    _memory.addFirst({});
  }

  /// alert this, dont exit all queue
  void exit() {
    if (_memory.length > 1) {
      _memory.removeFirst();
    }
  }

  /// input a variable to memory space
  void inputMemory(String name, dynamic value, DType type) {
    _memory.first[name] = MemorySpace(value, type);
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
