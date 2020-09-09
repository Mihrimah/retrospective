import 'package:retrospektive/template/abstract_base_template.dart';

class MadGladSad extends AbstractBaseTemplate {
  static final String templateName = "Mad Glad Sad";
  static final List<String> templateTitles = ["SAD", "MAD", "GLAD"];
  static final int templateType = 1;

  MadGladSad()
      : super(name: templateName, titles: templateTitles, type: templateType);

}
