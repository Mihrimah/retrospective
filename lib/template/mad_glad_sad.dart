import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:retrospective/core/grid_block.dart';
import 'package:retrospective/localization/retrospective_localization.dart';
import 'package:retrospective/template/abstract_base_template.dart';

class MadGladSad extends AbstractBaseTemplate {
  static final String templateName = "Mad Sad Glad";
  static final List<String> templateTitles = ["MAD", "SAD", "GLAD"];
  static final int templateType = 1;

  @override
  Widget getTemplateWidget(BuildContext context) {
    return GridBlock(
      title: templateName,
      description: templateTitles,
      infoTitle: templateName,
      infoMessage: RetrospectiveLocalization.of(context).madsadgladInfo,
    );
  }

  MadGladSad()
      : super(name: templateName, titles: templateTitles, type: templateType);

}
