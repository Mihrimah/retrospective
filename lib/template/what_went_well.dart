import 'package:retrospective/template/abstract_base_template.dart';

class WhatWentWell extends AbstractBaseTemplate {
  static final String templateName = "What Went Well";
  static final List<String> templateTitles = ["WHAT WENT WELL?", "WHAT DIDN'T GO WELL"];
  static final int templateType = 6;

  WhatWentWell()
      : super(name: templateName, titles: templateTitles, type: templateType);

}
