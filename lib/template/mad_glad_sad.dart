import 'package:flutter/material.dart';
import 'package:retrospective/template/abstract_base_template.dart';

class MadGladSad extends AbstractBaseTemplate {
  static final String templateName = "Mad Sad Glad";
  static final List<String> templateTitles = ["MAD", "SAD", "GLAD"];
  static final int templateType = 1;
  static final Color backgroundC = Colors.deepOrange;
  static final String backgroundI = "assets/images/madsadglad.png";

  MadGladSad()
      : super(name: templateName, titles: templateTitles, type: templateType, backgroundColor: backgroundC, backgroundImage: backgroundI);

}
