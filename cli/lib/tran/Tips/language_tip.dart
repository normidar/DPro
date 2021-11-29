abstract class LanguageTip {
  /// 適合したタイプの指向
  Map<String, String> typeMap();

  /// 転換ルールの指向
  Map<String, String> ruleMap();

  /// 今のインデント
  int indent = 0;
  void addIndent() {
    indent += 2;
  }

  void removeIndent() {
    indent -= 2;
    indent = indent < 0 ? 0 : indent;
  }
}
