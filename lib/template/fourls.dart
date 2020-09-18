import 'package:retrospective/template/abstract_base_template.dart';

class FourLs extends AbstractBaseTemplate {
  static final String templateName = "4 Ls";
  static final List<String> templateTitles = ["LIKED", "LEARNED", "LACKED", "LONGED FOR"];
  static final int templateType = 4;

  FourLs()
      : super(name: templateName, titles: templateTitles, type: templateType);

}
