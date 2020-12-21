import 'package:flutter/material.dart';
import 'package:retrospective/core/grid_block.dart';
import 'package:retrospective/localization/retrospective_localization.dart';
import 'package:retrospective/template/abstract_base_template.dart';

class FourLs extends AbstractBaseTemplate {
  static final String templateName = "4 Ls";
  static final List<String> templateTitles = [
    "LIKED",
    "LEARNED",
    "LACKED",
    "LONGED FOR"
  ];
  static final int templateType = 4;

  @override
  Widget getTemplateWidget(BuildContext context) {
    //List<Widget> list = templateTitles.map((e) => Text(e)).toList();
    return GridBlock(
      title: templateName,
      description: templateTitles,
      infoTitle: templateName,
      infoMessage: RetrospectiveLocalization.of(context).fourlsInfo,
    );
  }

  FourLs()
      : super(name: templateName, titles: templateTitles, type: templateType);
}
