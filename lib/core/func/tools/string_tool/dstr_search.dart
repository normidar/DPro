import 'package:dpro/core/func/value/dvalue.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';
import 'package:sprintf/sprintf.dart';

/// use a key to search in str(it will return int, when cant find it will return -1)
abstract class DStrSearch implements DValue {
  String get str;
  String get key;

  @override
  String tran(LanguageTip tip) {
    final format = tip.getRule("str_search");
    return sprintf(format, [str, key]);
  }
}

class OStrSearch with DStrSearch {
  @override
  String str;
  @override
  String key;
  OStrSearch({required this.str, required this.key});
}
