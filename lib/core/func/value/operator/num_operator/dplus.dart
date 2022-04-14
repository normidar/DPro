import 'package:dpro/core/dstatement.dart';
import 'package:dpro/core/func/value/dexpression.dart';
import 'package:dpro/core/func/value/operator/operator.dart';
import 'package:dpro/core/func/value/operator/operator_enum.dart';
import 'package:dpro/tran/lang_tips/language_tip.dart';

class DPlus extends DCalculate {
  DPlus(OperatorEnum operator, DStatement left, DStatement right)
      : super(operator, left, right);

  @override
  String getOperatorSign(LanguageTip tip) {
    // TODO: implement getOperatorSign
    throw UnimplementedError();
  }
}
