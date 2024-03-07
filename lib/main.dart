

import 'package:adminor/Settings/settingsPage.dart';
//import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//
// import 'package:page_transition/page_transition.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en", "US"),
        Locale("fa", "IR"),
      ],
      locale: const Locale("fa", "IR"),
      theme: ThemeData(
        fontFamily: 'mont',
        appBarTheme:
            const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),
      ),
      home: const /*StartAppSplashPage*/SettingsPage()
    );
  }
}
