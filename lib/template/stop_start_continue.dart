import 'package:flutter/material.dart';
import 'package:retrospective/template/abstract_base_template.dart';

class StopStartContinue extends AbstractBaseTemplate {
  static final String templateName = "Stop Start \n Continue";
  static final List<String> templateTitles = ["STOP", "START", "CONTINUE"];
  static final int templateType = 5;
  static final Color backgroundC = Colors.green;
  static final String backgroundI = "assets/images/madsadglad.png";

  StopStartContinue()
      : super(name: templateName, titles: templateTitles, type: templateType, backgroundColor: backgroundC, backgroundImage: backgroundI);
}
