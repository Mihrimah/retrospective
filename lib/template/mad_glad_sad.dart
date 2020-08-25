import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retrospektif/template/abstract_base_template.dart';

class MadGladSad extends AbstractBaseTemplate {
  static final String templateName = "Mad Glad Sad";
  static final List<String> templateTitles = ["Sad", "Mad", "Glad"];
  static final int templateType = 1;

  MadGladSad()
      : super(name: templateName, titles: templateTitles, type: templateType);

}
