abstract class LanguageTip {
  /// 適合したタイプの指向
  Map<String, String> typeMap();

  /// 転換ルールの指向
  // Map<String, String> ruleMap();

  String getRule(String index);
  bool getSetting(String index);
  String getKeyword(String name);

  OperatorInfo getOperatorInfo(String index);

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

/// 結合性
enum Fixity { left, right, none }

class OperatorInfo {
  OperatorInfo({
    required this.fixity,
    required this.preceding,
    required this.sign,
  });
  Fixity fixity;
  int preceding;
  String sign;

  @override
  bool operator ==(dynamic other) {
    return other is OperatorInfo &&
        other.sign == sign &&
        other.preceding == preceding;
  }

  @override
  int get hashCode => Object.hash(sign, fixity, preceding);
}
