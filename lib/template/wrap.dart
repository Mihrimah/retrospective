import 'package:retrospective/template/abstract_base_template.dart';

class WrapTechnique extends AbstractBaseTemplate {
  static final String templateName = "W.R.A.P.";
  static final List<String> templateTitles = ["WISHES", "RISKS", "APPRECIATIONS", "PUZZLES"];
  static final int templateType = 8;

  WrapTechnique()
      : super(name: templateName, titles: templateTitles, type: templateType);

}
