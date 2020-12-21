import 'package:flutter/material.dart';
import 'package:retrospective/localization/retrospective_localization.dart';

abstract class AbstractBaseTemplate {
  AbstractBaseTemplate({
    this.name,
    this.titles,
    this.type,
    this.backgroundColor,
    this.backgroundImage,
  });

  String name; // template name
  int type; // template type Id
  List<String> titles; // template type options like Sad, Mad, Glad
  Color backgroundColor; // template name background color
  String backgroundImage; // template content background color

  String getTemplateName() {
    return this.name;
  }

  int getTemplateTypeId() {
    return this.type;
  }

  List<String> getTitles() {
    return this.titles;
  }

  Color getBackgroundColor() {
    return this.backgroundColor;
  }

  Color getBackgroundImage() {
    return this.backgroundColor;
  }

  String getTemplateInfo(){
    return this.backgroundImage;
  }

  Widget getTemplateWidget(BuildContext context);

}
