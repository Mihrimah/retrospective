import 'package:flutter/material.dart';
import 'package:retrospective/template/abstract_base_template.dart';

class Sailorboat extends AbstractBaseTemplate {
  static final String templateName = "Sailor Boat";
  static final List<String> templateTitles = ["ANCHOR", "WIND"];
  static final int templateType = 3;
  static final Color backgroundC = Colors.lightBlueAccent;
  static final String backgroundI = "assets/images/starfish.PNG";

  Sailorboat()
      : super(name: templateName, titles: templateTitles, type: templateType, backgroundColor: backgroundC, backgroundImage: backgroundI);

}
