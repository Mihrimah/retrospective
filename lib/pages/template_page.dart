import 'package:flutter/material.dart';
import 'package:retrospektif/template/abstract_base_template.dart';
import 'package:retrospektif/template/mad_glad_sad.dart';

class TemplatePage extends StatelessWidget {
  final AbstractBaseTemplate madGladSadTemplate = MadGladSad();

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
                Navigator.pushNamed(context, "/grouped_list");
              },
              child: Container(
                color: Theme.of(context).primaryColorDark,
                padding: const EdgeInsets.all(8),
                child: madGladSadTemplate.getTemplateWidget(),
              ),
            )
          ],
        ));
  }
}
