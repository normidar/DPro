import 'package:dpro/core/dobject.dart';
import 'package:dpro/export.dart';
import 'package:dpro/tran/Tips/language_tip.dart';

class DType extends DObject {
  String type;
  List<String> generics;
  DType(this.type, {this.generics = const []});

  void reGeneric<T extends DList, DMap>(T target) {
    // TODO:
    // if(target is DList){
    //   target.
    // }
  }

  @override
  String tran(LanguageTip tip) {
    String _type = tip.typeMap()[type] ?? type;
    return _type;
  }
}
