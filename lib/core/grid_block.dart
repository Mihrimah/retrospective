import 'package:flutter/material.dart';
import 'package:retrospective/localization/retrospective_localization.dart';

class GridBlock extends StatelessWidget {
  final String title;
  final List<String> description;
  final String infoMessage;
  final String infoTitle;

  GridBlock({this.title, this.description, this.infoMessage, this.infoTitle});

  @override
  Widget build(BuildContext context) {
    List<Widget> list = description.map((e) => Text(e,style: TextStyle(color: Colors.white),)).toList();
    return Container(
      padding: const EdgeInsets.all(1),
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 18,color: Colors.white),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.info_outlined),
                        color:  Colors.white,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(infoTitle),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0))
                                  ),
                                  content: Text(infoMessage),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text(
                                          RetrospectiveLocalization.of(context)
                                              .gotIt,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                        })
                  ],
                ),
              ),
              Divider(color: Colors.white,height: 3,thickness: 2,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0,top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: list,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
      decoration: new BoxDecoration(
          color: Color(0xFF195E83),
          borderRadius: new BorderRadius.all(Radius.circular(15.0))),
    );
  }
}
