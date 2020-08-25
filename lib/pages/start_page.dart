import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [createButton(context), joinButton(context)]),
      ),
    );
  }

  RaisedButton joinButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {Navigator.pushNamed(context, "/join_room");},
      child: Text("Join Room"),
    );
  }

  RaisedButton createButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.pushNamed(context, "/choose_template");
      },
      child: Text("Create Room", style: Theme
          .of(context)
          .textTheme
          .bodyText1),
    );
  }
}
