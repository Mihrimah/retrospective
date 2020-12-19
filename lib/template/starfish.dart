import 'package:flutter/material.dart';
import 'package:retrospective/template/abstract_base_template.dart';

class Starfish extends AbstractBaseTemplate {
  static final String templateName = "Starfish";
  static final List<String> templateTitles = ["LESS", "KEEP", "MORE", "START", "STOP"];
  static final int templateType = 2;
  static final Color backgroundC = Colors.lime;
  static final String backgroundI = "assets/images/madsadglad.png";

  Starfish()
      : super(name: templateName, titles: templateTitles, type: templateType, backgroundColor: backgroundC, backgroundImage: backgroundI);

}
