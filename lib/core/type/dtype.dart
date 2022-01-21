import 'package:dpro/core/dobject.dart';
import 'package:dpro/export.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

class DType extends DObject {
  late String type;
  late List<DType> generics;
  DType(this.type, {this.generics = const []});

  DType.fromValue(DObject target) {
    generics = [];
    reType(target);
  }

  void reType(DObject target) {
    // TODO: support char float float double
    if (target is DString) {
      type = "str";
    } else if (target is DInt) {
      type = "int";
    } else if (target is DBool) {
      type = "bool";
    } else if (target is DList) {
      type = "list";
      generics.add(target.type);
    } else if (target is DMap) {
      type = "map";
      generics.add(target.keyType);
      generics.add(target.valueType);
    } else {
      throw Exception("this target can not support retype");
    }
  }

  @override
  String tran(LanguageTip tip) {
    String _type = tip.typeMap()[type] ?? type;
    if (generics.isEmpty || tip.toString() != "java") {
      return _type;
    }
    // 総称がある時に
    String format = tip.getRule("generic");
    List<String> _generics = generics.map((e) => e.tran(tip)).toList();
    return sprintf(format, [
      _type,
      _generics.join(", "),
    ]);
  }
}

abstract class IType implements IObject {
  String get type;

  @override
  T toDObject<T extends DObject>() {
    return DType(type) as T;
  }
}
