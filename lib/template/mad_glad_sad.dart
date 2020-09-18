import 'package:retrospective/template/abstract_base_template.dart';

class MadGladSad extends AbstractBaseTemplate {
  static final String templateName = "Mad Sad Glad";
  static final List<String> templateTitles = ["SAD", "MAD", "GLAD"];
  static final int templateType = 1;

  MadGladSad()
      : super(name: templateName, titles: templateTitles, type: templateType);

}
