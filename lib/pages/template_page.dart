import 'package:flutter/material.dart';
import 'package:retrospektive/core/code_generator.dart';
import 'package:retrospektive/localization/retrospective_localization.dart';
import 'package:retrospektive/model/retro_page_params.dart';
import 'package:retrospektive/template/abstract_base_template.dart';
import 'package:retrospektive/template/mad_glad_sad.dart';
import 'package:retrospektive/template/sailorboat.dart';
import 'package:retrospektive/template/starfish.dart';
import 'package:retrospektive/template/fourls.dart';

class TemplatePage extends StatelessWidget {
  final AbstractBaseTemplate madGladSadTemplate = MadGladSad();
  final AbstractBaseTemplate starfishTemplate = Starfish();
  final AbstractBaseTemplate sailorboatTemplate = Sailorboat();
  final AbstractBaseTemplate fourLsTemplate = FourLs();
  final CodeGenerator _codeGenerator = CodeGenerator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(RetrospectiveLocalization.of(context).chooseTemplate),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",arguments: RetroPageParams(madGladSadTemplate,roomCodeGenerate(madGladSadTemplate.getTemplateTypeId())));
              },
              child: Container(
                color: Theme.of(context).primaryColorDark,
                padding: const EdgeInsets.all(8),
                child: madGladSadTemplate.getTemplateWidget(context),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",arguments: RetroPageParams(starfishTemplate,roomCodeGenerate(starfishTemplate.getTemplateTypeId())));
              },
              child: Container(
                color: Theme.of(context).primaryColorDark,
                padding: const EdgeInsets.all(8),
                child: starfishTemplate.getTemplateWidget(context),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",arguments: RetroPageParams(sailorboatTemplate,roomCodeGenerate(sailorboatTemplate.getTemplateTypeId())));
              },
              child: Container(
                color: Theme.of(context).primaryColorDark,
                padding: const EdgeInsets.all(8),
                child: sailorboatTemplate.getTemplateWidget(context),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",arguments: RetroPageParams(fourLsTemplate,roomCodeGenerate(fourLsTemplate.getTemplateTypeId())));
              },
              child: Container(
                color: Theme.of(context).primaryColorDark,
                padding: const EdgeInsets.all(8),
                child: fourLsTemplate.getTemplateWidget(context),
              ),
            ),
          ],
        ));
  }
  String roomCodeGenerate(int templateId){
    return _codeGenerator.generateRoomCode(templateId);
  }
}
