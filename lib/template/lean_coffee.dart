import 'package:flutter/material.dart';
import 'package:retrospective/core/grid_block.dart';
import 'package:retrospective/localization/retrospective_localization.dart';
import 'package:retrospective/template/abstract_base_template.dart';

class LeanCoffee extends AbstractBaseTemplate {
  static final String templateName = "Lean Coffee";
  static final List<String> templateTitles = ["TO DO", "DOING", "DONE"];
  static final int templateType = 7;
  static final Color backgroundC = Colors.brown;
  static final String backgroundI = "assets/images/madsadglad.png";

  LeanCoffee()
      : super(name: templateName, titles: templateTitles, type: templateType);

  @override
  Widget getTemplateWidget(BuildContext context) {
    return GridBlock(
      title: templateName,
      description: templateTitles,
      infoTitle: templateName,
      infoMessage: RetrospectiveLocalization.of(context).leancoffeeInfo,
    );
  }
}
