import 'package:flutter/material.dart';
import 'package:retrospective/core/grid_block.dart';
import 'package:retrospective/localization/retrospective_localization.dart';
import 'package:retrospective/template/abstract_base_template.dart';

class FreeFormat extends AbstractBaseTemplate {
  static final String templateName = "Free Format";
  static final List<String> templateTitles = ["COMMENT"];
  static final int templateType = 9;

  FreeFormat()
      : super(name: templateName, titles: templateTitles, type: templateType);

  @override
  Widget getTemplateWidget(BuildContext context) {
    return GridBlock(
      title: templateName,
      description: templateTitles,
      infoTitle: templateName,
      infoMessage: RetrospectiveLocalization.of(context).freeformatInfo,
    );
  }

}
