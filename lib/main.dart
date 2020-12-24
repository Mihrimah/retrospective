import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrospective/app.dart';
import 'package:retrospective/model/theme_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      builder: (_) => ThemeProvider(isLightTheme: false),
      child: App(),
    ),
  );
}