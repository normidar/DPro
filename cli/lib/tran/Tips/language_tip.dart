abstract class LanguageTip {
  String give(String target, String content) {
    // TODO:
    return "";
  }

  /// 適合したタイプの指向
  Map<String, String> typeMap();

  /// 転換ルールの指向
  Map<String, String> ruleMap();
}
