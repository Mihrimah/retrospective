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

  Widget getTemplateWidget(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
            title: Text(name),
            backgroundColor: backgroundColor,
            leading: Text(''),
            actions: [
              // action button
              IconButton(
                  icon: Icon(Icons.info_outlined),
                  onPressed: () {
                    if (type == 1) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            backgroundColor: backgroundColor,
                            title: new Text(name),
                            content: new Text(
                                RetrospectiveLocalization.of(context)
                                    .madsadgladInfo),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text(
                                    RetrospectiveLocalization.of(context).gotIt,
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else if (type == 2) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            backgroundColor: backgroundColor,
                            title: new Text(name),
                            content: new Text(
                                RetrospectiveLocalization.of(context)
                                    .starfishInfo),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text(
                                    RetrospectiveLocalization.of(context).gotIt,
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else if (type == 3) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            backgroundColor: backgroundColor,
                            title: new Text(name),
                            content: new Text(
                                RetrospectiveLocalization.of(context)
                                    .sailorboatInfo),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text(
                                    RetrospectiveLocalization.of(context).gotIt,
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else if (type == 4) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            backgroundColor: backgroundColor,
                            title: new Text(name),
                            content: new Text(
                                RetrospectiveLocalization.of(context)
                                    .fourlsInfo),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text(
                                    RetrospectiveLocalization.of(context).gotIt,
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else if (type == 5) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            backgroundColor: backgroundColor,
                            title: new Text(name),
                            content: new Text(
                                RetrospectiveLocalization.of(context)
                                    .startstopcontinueInfo),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text(
                                    RetrospectiveLocalization.of(context).gotIt,
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else if (type == 6) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            backgroundColor: backgroundColor,
                            title: new Text(name),
                            content: new Text(
                                RetrospectiveLocalization.of(context)
                                    .whatwentwellInfo),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text(
                                    RetrospectiveLocalization.of(context).gotIt,
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else if (type == 7) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            backgroundColor: backgroundColor,
                            title: new Text(name),
                            content: new Text(
                                RetrospectiveLocalization.of(context)
                                    .leancoffeeInfo),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text(
                                    RetrospectiveLocalization.of(context).gotIt,
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else if (type == 8) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            backgroundColor: backgroundColor,
                            title: new Text(name),
                            content: new Text(
                                RetrospectiveLocalization.of(context).wrapInfo),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text(
                                    RetrospectiveLocalization.of(context).gotIt,
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else if (type == 9) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            backgroundColor: backgroundColor,
                            title: new Text(name),
                            content: new Text(
                                RetrospectiveLocalization.of(context)
                                    .freeformatInfo),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text(
                                    RetrospectiveLocalization.of(context).gotIt,
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                      //Navigator.pushNamed(context, "/info",arguments: InfoPage());
                    }
                  })
            ]),
        body: Center(
            child: Container(
          margin: EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(backgroundImage.toString()),
                  fit: BoxFit.cover)),
          child: Column(
              children: List.generate(titles.length, (index) {
            return Center(
                child: Text('-' + titles[index].toString(),
                    style: Theme.of(context).textTheme.headline6));
          })),
        )));
  }
}
