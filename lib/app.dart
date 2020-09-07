import 'package:flutter/material.dart';
import 'package:retrospektif/pages/add_new_content_page.dart';
import 'package:retrospektif/pages/join_page.dart';
import 'package:retrospektif/pages/retro_page.dart';
import 'package:retrospektif/pages/start_page.dart';
import 'package:retrospektif/pages/template_page.dart';

class App extends StatelessWidget {
  final routes = {
    '/start': (context) => StartPage(),
    '/choose_template': (context) => TemplatePage(),
    '/join_room': (context) => JoinPage(),
    '/retro' : (context) => RetroPage(ModalRoute.of(context).settings.arguments),
    //'/add_new_content': (context) => AddNewContentPage(ModalRoute.of(context).settings.arguments)
  };

  final darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF212121),
      accentColor: Colors.white,
      accentIconTheme: IconThemeData(color: Colors.black),
      dividerColor: Colors.black12);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/start',
      routes: routes,
      theme: darkTheme,
      home: StartPage(),
    );
  }
}
