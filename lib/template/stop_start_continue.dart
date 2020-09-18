import 'package:retrospective/template/abstract_base_template.dart';

class StopStartContinue extends AbstractBaseTemplate {
  static final String templateName = "Stop Start \n Continue";
  static final List<String> templateTitles = ["STOP", "START", "CONTINUE"];
  static final int templateType = 5;

  StopStartContinue()
      : super(name: templateName, titles: templateTitles, type: templateType);

}
