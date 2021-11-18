import '../../dobject.dart';

class Calculate extends DObject {
  String calStr;
  DObject left;
  DObject right;
  Calculate(this.calStr, this.left, this.right);
}
