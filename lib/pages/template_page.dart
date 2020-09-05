import 'package:flutter/material.dart';
import 'package:retrospektif/core/code_generator.dart';
import 'package:retrospektif/template/abstract_base_template.dart';
import 'package:retrospektif/template/mad_glad_sad.dart';
import 'package:retrospektif/template/starfish.dart';

class TemplatePage extends StatelessWidget {
  final AbstractBaseTemplate madGladSadTemplate = MadGladSad();
  final AbstractBaseTemplate starfishTemplate = Starfish();

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
                Navigator.pushNamed(context, "/retro",arguments: madGladSadTemplate);
              },
              child: Container(
                color: Theme.of(context).primaryColorDark,
                padding: const EdgeInsets.all(8),
                child: madGladSadTemplate.getTemplateWidget(),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",arguments: starfishTemplate);
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
}
