import 'package:flutter/material.dart';
import 'package:retrospective/localization/retrospective_localization.dart';
import 'package:retrospective/model/retro_page_params.dart';
import 'package:retrospective/template/abstract_base_template.dart';
import 'package:retrospective/template/fourls.dart';
import 'package:retrospective/template/freeformat.dart';
import 'package:retrospective/template/lean_coffee.dart';
import 'package:retrospective/template/mad_glad_sad.dart';
import 'package:retrospective/template/sailorboat.dart';
import 'package:retrospective/template/starfish.dart';
import 'package:provider/provider.dart';
import 'package:retrospective/model/theme_provider.dart';
import 'package:retrospective/template/stop_start_continue.dart';
import 'package:retrospective/template/what_went_well.dart';
import 'package:retrospective/template/wrap.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage>
    with SingleTickerProviderStateMixin {
  TextEditingController _textEditingController = TextEditingController();
  bool isEnabled = false;
  AnimationController _controller;
  Animation _animation;

  @override
  Widget build(BuildContext context) {
    if(_controller.isCompleted) _controller.reset();
    _controller.forward();
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(right: 50, left: 50),
                  child: Column(
                    children: [
                      Center(
                          child: AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          String textR = "R";
                          String text = "Retrospective".substring(1,_animation.value);
                          return Row(
                            children: [
                              Text(
                                textR,
                                style: TextStyle(fontSize: 100),
                              ),
                              Text(
                                  text,
                                style: TextStyle(fontSize: 40),
                              ),
                            ],
                          );
                        },
                      )),
                      SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: Text(
                            RetrospectiveLocalization.of(context).retrospectiveExp,
                            style: TextStyle(fontSize: 16)),
                      ),
                      SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          onPressed: () {
                            Navigator.pushNamed(context, "/choose_template");
                          },
                          child: Text(
                              RetrospectiveLocalization.of(context).createRoom,
                              style: Theme.of(context).textTheme.headline6),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText:
                                RetrospectiveLocalization.of(context).roomCode,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor),
                            ),
                          ),
                          controller: _textEditingController,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                        width: double.infinity,
                      ),
                      SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          onPressed: isEnabled
                              ? () {
                                  Navigator.pushNamed(context, "/retro",
                                      arguments: RetroPageParams(
                                          _parseRoomCode(
                                              _textEditingController.text),
                                          _textEditingController.text));
                                }
                              : null,
                          child: Text(
                            RetrospectiveLocalization.of(context).joinRoom,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                        width: double.infinity,
                      ),
                      SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          onPressed: () {
                            Navigator.pushNamed(context, "/saved_history");
                          },
                          child: Text(
                            RetrospectiveLocalization.of(context).historyList,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.wb_sunny),
                          Switch(
                            value: themeProvider.isLightTheme,
                            onChanged: (val) {
                              themeProvider.setThemeData = val;
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    super.dispose();
    _textEditingController.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _animation = IntTween(begin: 1, end: 13).animate(_controller);
    _controller.forward();
    _textEditingController.addListener(_checkButtonEnable);
  }

  _checkButtonEnable() {
    if (_textEditingController == null ||
        _textEditingController.text == '' ||
        _textEditingController.text == null) {
      setState(() {
        isEnabled = false;
      });
    } else {
      setState(() {
        isEnabled = true;
      });
    }
  }

  AbstractBaseTemplate _parseRoomCode(String roomCode) {
    int firstNumber = int.parse(roomCode.substring(0, 1));
    if (firstNumber == 1)
      return MadGladSad();
    else if (firstNumber == 2)
      return Starfish();
    else if (firstNumber == 3)
      return Sailorboat();
    else if (firstNumber == 4)
      return FourLs();
    else if (firstNumber == 5)
      return StopStartContinue();
    else if (firstNumber == 6)
      return WhatWentWell();
    else if (firstNumber == 7)
      return LeanCoffee();
    else if (firstNumber == 8)
      return WrapTechnique();
    else if (firstNumber == 9)
      return FreeFormat();
    else
      return MadGladSad();
  }
}
