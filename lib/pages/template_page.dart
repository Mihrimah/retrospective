import 'package:flutter/material.dart';
import 'package:retrospective/core/code_generator.dart';
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
          childAspectRatio: 2,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",
                    arguments: RetroPageParams(
                        madGladSadTemplate,
                        roomCodeGenerate(
                            madGladSadTemplate.getTemplateTypeId())));
              },
              child: Container(
                padding: const EdgeInsets.all(1),
                child: madGladSadTemplate.getTemplateWidget(context),
                decoration: new BoxDecoration(
                    color: Color(0xFF195E83),
                    borderRadius: new BorderRadius.all(Radius.circular(15.0))),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",
                    arguments: RetroPageParams(
                        starfishTemplate,
                        roomCodeGenerate(
                            starfishTemplate.getTemplateTypeId())));
              },
              child: Container(
                padding: const EdgeInsets.all(1),
                child: starfishTemplate.getTemplateWidget(context),
                decoration: new BoxDecoration(
                    color: Color(0xFF195E83),
                    borderRadius: new BorderRadius.all(Radius.circular(15.0))),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",
                    arguments: RetroPageParams(
                        sailorboatTemplate,
                        roomCodeGenerate(
                            sailorboatTemplate.getTemplateTypeId())));
              },
              child: Container(
                padding: const EdgeInsets.all(1),
                child: sailorboatTemplate.getTemplateWidget(context),
                decoration: new BoxDecoration(
                    color: Color(0xFF195E83),
                    borderRadius: new BorderRadius.all(Radius.circular(15.0))),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",
                    arguments: RetroPageParams(fourLsTemplate,
                        roomCodeGenerate(fourLsTemplate.getTemplateTypeId())));
              },
              child: Container(
                padding: const EdgeInsets.all(1),
                child: fourLsTemplate.getTemplateWidget(context),
                decoration: new BoxDecoration(
                    color: Color(0xFF195E83),
                    borderRadius: new BorderRadius.all(Radius.circular(15.0))),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",
                    arguments: RetroPageParams(
                        stopStartContinueTemplate,
                        roomCodeGenerate(
                            stopStartContinueTemplate.getTemplateTypeId())));
              },
              child: Container(
                padding: const EdgeInsets.all(1),
                child: stopStartContinueTemplate.getTemplateWidget(context),
                decoration: new BoxDecoration(
                    color: Color(0xFF195E83),
                    borderRadius: new BorderRadius.all(Radius.circular(15.0))),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",
                    arguments: RetroPageParams(
                        whatWentWellTemplate,
                        roomCodeGenerate(
                            whatWentWellTemplate.getTemplateTypeId())));
              },
              child: Container(
                padding: const EdgeInsets.all(1),
                child: whatWentWellTemplate.getTemplateWidget(context),
                decoration: new BoxDecoration(
                    color: Color(0xFF195E83),
                    borderRadius: new BorderRadius.all(Radius.circular(15.0))),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",
                    arguments: RetroPageParams(
                        leanCoffeeTemplate,
                        roomCodeGenerate(
                            leanCoffeeTemplate.getTemplateTypeId())));
              },
              child: Container(
                padding: const EdgeInsets.all(1),
                child: leanCoffeeTemplate.getTemplateWidget(context),
                decoration: new BoxDecoration(
                    color: Color(0xFF195E83),
                    borderRadius: new BorderRadius.all(Radius.circular(15.0))),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",
                    arguments: RetroPageParams(wrapTemplate,
                        roomCodeGenerate(wrapTemplate.getTemplateTypeId())));
              },
              child: Container(
                padding: const EdgeInsets.all(1),
                child: wrapTemplate.getTemplateWidget(context),
                decoration: new BoxDecoration(
                    color: Color(0xFF195E83),
                    borderRadius: new BorderRadius.all(Radius.circular(15.0))),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",
                    arguments: RetroPageParams(freeFormat,
                        roomCodeGenerate(freeFormat.getTemplateTypeId())));
              },
              child: Container(
                padding: const EdgeInsets.all(1),
                child: freeFormat.getTemplateWidget(context),
                decoration: new BoxDecoration(
                    color: Color(0xFF195E83),
                    borderRadius: new BorderRadius.all(Radius.circular(15.0))),
              ),
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
