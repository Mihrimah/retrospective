import 'package:flutter/material.dart';
import 'package:retrospective/template/abstract_base_template.dart';

class FourLs extends AbstractBaseTemplate {
  static final String templateName = "4 Ls";
  static final List<String> templateTitles = ["LIKED", "LEARNED", "LACKED", "LONGED FOR"];
  static final int templateType = 4;
  static final Color backgroundC = Colors.yellowAccent;
  static final String backgroundI = "assets/images/r_logo.png";

  FourLs()
      : super(name: templateName, titles: templateTitles, type: templateType, backgroundColor: backgroundC, backgroundImage: backgroundI);
}
