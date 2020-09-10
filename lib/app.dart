import 'package:flutter/material.dart';
import 'package:retrospektive/pages/join_page.dart';
import 'package:retrospektive/pages/retro_page.dart';
import 'package:retrospektive/pages/start_page.dart';
import 'package:retrospektive/pages/template_page.dart';
import "package:provider/provider.dart";
import 'package:retrospektive/model/theme_provider.dart';

class App extends StatelessWidget {
  final routes = {
    '/start': (context) => StartPage(),
    '/choose_template': (context) => TemplatePage(),
    '/join_room': (context) => JoinPage(),
    '/retro' : (context) => RetroPage(ModalRoute.of(context).settings.arguments),
    //'/add_new_content': (context) => AddNewContentPage(ModalRoute.of(context).settings.arguments)
  };

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      initialRoute: '/start',
      routes: routes,
      theme: themeProvider.getThemeData,
      home: StartPage(),
    );
  }
}
