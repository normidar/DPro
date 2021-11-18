import '../../dobject.dart';

/// 定義して 値を与える　：＝
class DefGive extends DObject {
  String type;
  DObject target;
  DObject content;
  DefGive({required this.target, required this.content, required this.type});
}
