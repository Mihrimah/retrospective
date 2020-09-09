import 'package:retrospektive/template/abstract_base_template.dart';

class Starfish extends AbstractBaseTemplate {
  static final String templateName = "Starfish";
  static final List<String> templateTitles = ["LESS", "KEEP", "MORE", "START", "STOP"];
  static final int templateType = 2;

  Starfish()
      : super(name: templateName, titles: templateTitles, type: templateType);

}
