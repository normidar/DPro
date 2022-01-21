import '../tran/Tips/language_tip.dart';
import 'package:auto_exporter/auto_exporter.dart';

@AutoExporter()
abstract class DObject {
  String tran(LanguageTip tip);
}

abstract class IObject {
  T toDObject<T extends DObject>();
}
