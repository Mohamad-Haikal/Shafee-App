// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:shafee_app/services/routes.dart';
import 'package:shafee_app/shared/home.dart';
import 'package:shafee_app/resources.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
  // runApp(DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  static int appbarIndex = 2;

  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context) {
    return WillPopScope(
        onWillPop: () async {
          // exit the app
          Navigator.pushNamed(context, '/');
          return true;
        },
        child: MaterialApp(
          localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          debugShowCheckedModeBanner: false,
          // showPerformanceOverlay: true,
          onGenerateRoute: (settings) {
            return RouterCtrl.generateRoute(settings);
          },
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: ColorsData.mainData['font'],
            primaryColor: ColorsData.primaryColor,
          ),
          initialRoute: '/',
          routes: {
            "/": (context) => const Home(),
          },
        ));
  }
}
