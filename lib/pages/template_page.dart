import 'package:flutter/material.dart';
import 'package:retrospective/core/code_generator.dart';
import 'package:retrospective/core/grid_block.dart';
import 'package:retrospective/localization/retrospective_localization.dart';
import 'package:retrospective/model/retro_page_params.dart';
import 'package:retrospective/repository/firebase_repository.dart';
import 'package:retrospective/template/abstract_base_template.dart';
import 'package:retrospective/template/freeformat.dart';
import 'package:retrospective/template/lean_coffee.dart';
import 'package:retrospective/template/mad_glad_sad.dart';
import 'package:retrospective/template/sailorboat.dart';
import 'package:retrospective/template/starfish.dart';
import 'package:retrospective/template/fourls.dart';
import 'package:retrospective/template/stop_start_continue.dart';
import 'package:retrospective/template/what_went_well.dart';
import 'package:retrospective/template/wrap.dart';

class TemplatePage extends StatelessWidget {
  final AbstractBaseTemplate madGladSadTemplate = MadGladSad();
  final AbstractBaseTemplate starfishTemplate = Starfish();
  final AbstractBaseTemplate sailorboatTemplate = Sailorboat();
  final AbstractBaseTemplate fourLsTemplate = FourLs();
  final AbstractBaseTemplate stopStartContinueTemplate = StopStartContinue();
  final AbstractBaseTemplate whatWentWellTemplate = WhatWentWell();
  final AbstractBaseTemplate leanCoffeeTemplate = LeanCoffee();
  final AbstractBaseTemplate wrapTemplate = WrapTechnique();
  final AbstractBaseTemplate freeFormat = FreeFormat();

  final CodeGenerator _codeGenerator = CodeGenerator();
  final FirebaseRepository _firebaseRepository = FirebaseRepository();

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
          childAspectRatio: 1,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",
                    arguments: RetroPageParams(
                        madGladSadTemplate,
                        roomCodeGenerate(
                            madGladSadTemplate.getTemplateTypeId())));
              },
              child: madGladSadTemplate.getTemplateWidget(context),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",
                    arguments: RetroPageParams(
                        starfishTemplate,
                        roomCodeGenerate(
                            starfishTemplate.getTemplateTypeId())));
              },
              child: starfishTemplate.getTemplateWidget(context),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",
                    arguments: RetroPageParams(
                        sailorboatTemplate,
                        roomCodeGenerate(
                            sailorboatTemplate.getTemplateTypeId())));
              },
              child: sailorboatTemplate.getTemplateWidget(context),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",
                    arguments: RetroPageParams(fourLsTemplate,
                        roomCodeGenerate(fourLsTemplate.getTemplateTypeId())));
              },
              child: fourLsTemplate.getTemplateWidget(context),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",
                    arguments: RetroPageParams(
                        stopStartContinueTemplate,
                        roomCodeGenerate(
                            stopStartContinueTemplate.getTemplateTypeId())));
              },
              child: stopStartContinueTemplate.getTemplateWidget(context),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",
                    arguments: RetroPageParams(
                        whatWentWellTemplate,
                        roomCodeGenerate(
                            whatWentWellTemplate.getTemplateTypeId())));
              },
              child: whatWentWellTemplate.getTemplateWidget(context),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",
                    arguments: RetroPageParams(
                        leanCoffeeTemplate,
                        roomCodeGenerate(
                            leanCoffeeTemplate.getTemplateTypeId())));
              },
              child: leanCoffeeTemplate.getTemplateWidget(context),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",
                    arguments: RetroPageParams(wrapTemplate,
                        roomCodeGenerate(wrapTemplate.getTemplateTypeId())));
              },
              child: wrapTemplate.getTemplateWidget(context),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",
                    arguments: RetroPageParams(freeFormat,
                        roomCodeGenerate(freeFormat.getTemplateTypeId())));
              },
              child: freeFormat.getTemplateWidget(context),
            ),
          ],
        ));
  }

  String roomCodeGenerate(int templateId) {
    String roomCode = _codeGenerator.generateRoomCode(templateId);
    _firebaseRepository.createRoomDetail(roomCode, templateId);
    return roomCode;
  }
}
