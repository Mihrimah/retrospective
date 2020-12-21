import 'package:flutter/material.dart';
import 'package:retrospective/localization/retrospective_localization.dart';
import 'package:retrospective/template/abstract_base_template.dart';

class Starfish extends AbstractBaseTemplate {
  static final String templateName = "Starfish";
  static final List<String> templateTitles = [
    "LESS",
    "KEEP",
    "MORE",
    "START",
    "STOP"
  ];
  static final int templateType = 2;

  Widget getTemplateWidget(BuildContext context) {
    return ListTile(
        title: Text(name),
        trailing: IconButton(
            icon: Icon(Icons.info_outlined),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: new Text(name),
                      content: new Text(
                          RetrospectiveLocalization.of(context).starfishInfo),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        new FlatButton(
                          child: new Text(
                              RetrospectiveLocalization.of(context).gotIt,
                              style: Theme.of(context).textTheme.headline6),
                          onPressed: () {
                            // Close the dialog
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
            }),
        /*subtitle: Center(
            child: Column(
                children: List.generate(titles.length, (index) {
          return Center(
              child: Text(titles[index].toString(),
                  style: Theme.of(context).textTheme.headline6));
        })))*/);
  }

  Starfish()
      : super(name: templateName, titles: templateTitles, type: templateType);
}
