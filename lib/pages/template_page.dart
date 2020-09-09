import 'package:flutter/material.dart';
import 'package:retrospektive/core/code_generator.dart';
import 'package:retrospektive/model/retro_page_params.dart';
import 'package:retrospektive/template/abstract_base_template.dart';
import 'package:retrospektive/template/mad_glad_sad.dart';
import 'package:retrospektive/template/starfish.dart';

class TemplatePage extends StatelessWidget {
  final AbstractBaseTemplate madGladSadTemplate = MadGladSad();
  final AbstractBaseTemplate starfishTemplate = Starfish();
  final CodeGenerator _codeGenerator = CodeGenerator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Choose Template"),
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
                child: madGladSadTemplate.getTemplateWidget(),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",arguments: RetroPageParams(starfishTemplate,roomCodeGenerate(starfishTemplate.getTemplateTypeId())));
              },
              child: Container(
                color: Theme.of(context).primaryColorDark,
                padding: const EdgeInsets.all(8),
                child: starfishTemplate.getTemplateWidget(),
              ),
            )
          ],
        ));
  }
  String roomCodeGenerate(int templateId){
    return _codeGenerator.generateRoomCode(templateId);
  }
}
