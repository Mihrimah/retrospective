import 'package:flutter/material.dart';
import 'package:retrospective/core/grid_block.dart';
import 'package:retrospective/localization/retrospective_localization.dart';
import 'package:retrospective/template/abstract_base_template.dart';

class Starfish extends AbstractBaseTemplate {
  static final String templateName = "Starfish";
  static final List<String> templateTitles = [
    "LESS",
    "KEEP",
    "MORE",
    "START",
    "STOP"
  ];
  static final int templateType = 2;

  @override
  Widget getTemplateWidget(BuildContext context) {
    return GridBlock(
      title: templateName,
      description: templateTitles,
      infoTitle: templateName,
      infoMessage: RetrospectiveLocalization.of(context).starfishInfo,
    );
  }

  Starfish()
      : super(name: templateName, titles: templateTitles, type: templateType);
}
