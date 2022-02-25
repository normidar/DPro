import 'package:dpro/core/dobject.dart';
import 'package:dpro/tran/Tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

class DType implements DObject {
  late String type;
  late List<DType> generics;
  DType(this.type, {this.generics = const []});

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
