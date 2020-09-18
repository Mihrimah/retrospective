import 'package:retrospective/template/abstract_base_template.dart';

class LeanCoffee extends AbstractBaseTemplate {
  static final String templateName = "Lean Coffee";
  static final List<String> templateTitles = ["TO DO", "DOING", "DONE"];
  static final int templateType = 7;

  LeanCoffee()
      : super(name: templateName, titles: templateTitles, type: templateType);

}
