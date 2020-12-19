import 'package:flutter/material.dart';
import 'package:retrospective/template/abstract_base_template.dart';

class WrapTechnique extends AbstractBaseTemplate {
  static final String templateName = "W.R.A.P.";
  static final List<String> templateTitles = ["WISHES", "RISKS", "APPRECIATIONS", "PUZZLES"];
  static final int templateType = 8;
  static final Color backgroundC = Colors.redAccent;
  static final String backgroundI = "assets/images/madsadglad.png";

  WrapTechnique()
      : super(name: templateName, titles: templateTitles, type: templateType, backgroundColor: backgroundC, backgroundImage: backgroundI);
}
