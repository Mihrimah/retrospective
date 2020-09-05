import 'package:flutter/material.dart';

abstract class AbstractBaseTemplate {
  AbstractBaseTemplate({this.name, this.titles, this.type});

  String name;// template name
  int type; // template type Id
  List<String> titles; // template type options like Sad, Mad, Glad

  String getTemplateName() {
    return this.name;
  }

  int getTemplateTypeId() {
    return this.type;
  }

  List<String> getTitles() {
    return this.titles;
  }

  Widget getTemplateWidget() {
    return Center(
        child: Text(
      name,
      style: TextStyle(fontSize: 20),
    ));
  }
}
