// ignore_for_file: unrelated_type_equality_checks

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:shafee_app/services/routes.dart';
import 'package:shafee_app/shared/home.dart';
import 'package:shafee_app/resources.dart';

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
  // runApp(DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  static int appbarIndex = 2;
  static String profileImageUrl = 'null';

  MyApp({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(context) {
    return WillPopScope(
        onWillPop: () async {
          // exit the app
          print('object');
          Navigator.pushNamed(context, '/');
          return true;
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // showPerformanceOverlay: true,
          onGenerateRoute: (settings) {
            return RouterCtrl.generateRoute(settings);
          },
          theme: ThemeData(
            fontFamily: ColorsData.mainData['font'],
            primaryColor: ColorsData.primaryColor,
          ),
          initialRoute: '/',
          routes: {
            "/": (context) => Home(),
          },
        ));
  }
}
