import 'package:retrospektive/template/abstract_base_template.dart';

class Sailorboat extends AbstractBaseTemplate {
  static final String templateName = "Sailorboat";
  static final List<String> templateTitles = ["ANCHOR", "WIND"];
  static final int templateType = 3;

  Sailorboat()
      : super(name: templateName, titles: templateTitles, type: templateType);

}
