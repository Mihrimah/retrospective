import 'package:flutter/material.dart';
import 'package:retrospective/core/grid_block.dart';
import 'package:retrospective/localization/retrospective_localization.dart';
import 'package:retrospective/template/abstract_base_template.dart';

class Sailorboat extends AbstractBaseTemplate {
  static final String templateName = "Sailor Boat";
  static final List<String> templateTitles = ["ANCHOR", "WIND"];
  static final int templateType = 3;

  @override
  Widget getTemplateWidget(BuildContext context) {
    return GridBlock(
      title: templateName,
      description: templateTitles,
      infoTitle: templateName,
      infoMessage: RetrospectiveLocalization.of(context).sailorboatInfo,
    );
  }

  Sailorboat()
      : super(name: templateName, titles: templateTitles, type: templateType);
}
