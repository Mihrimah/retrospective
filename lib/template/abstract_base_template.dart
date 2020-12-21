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

  Widget getTemplateWidget(BuildContext context) {
    return ListTile(
        title: Text(name,style: Theme.of(context).textTheme.bodyText1),
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
                          RetrospectiveLocalization.of(context).madsadgladInfo),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        new FlatButton(
                          child: new Text(
                              RetrospectiveLocalization.of(context).gotIt,
                              style: Theme.of(context).textTheme.bodyText2),
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
                  style: Theme.of(context).textTheme.bodyText1));
        })))*/);
  }
}
