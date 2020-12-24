import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:retrospective/pages/retro_page.dart';
import 'package:retrospective/pages/saved_history_list_page.dart';
import 'package:retrospective/pages/start_page.dart';
import 'package:retrospective/pages/template_page.dart';
import "package:provider/provider.dart";
import 'package:retrospective/model/theme_provider.dart';

import 'localization/retrospective_localizations_delegate.dart';

class App extends StatelessWidget {
  final routes = {
    '/start': (context) => StartPage(),
    '/choose_template': (context) => TemplatePage(),
    '/retro' : (context) => RetroPage(ModalRoute.of(context).settings.arguments),
    '/saved_history' : (context) => SavedHistoryListPage(),
    //'/add_new_content': (context) => AddNewContentPage(ModalRoute.of(context).settings.arguments)
  };

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      initialRoute: '/start',
      debugShowCheckedModeBanner: false,
      routes: routes,
      theme: themeProvider.getThemeData,
      home: StartPage(),
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        const RetrospectiveLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('tr', 'TR'),
        const Locale('de', 'DE'),
        const Locale('es', 'ES'),
        const Locale('it', 'IT'),
        const Locale('fr', 'FR'),
      ],
    );
  }
}
