// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shafee_app/services/firebase.dart';
import 'package:shafee_app/student/screens/StudentDashboardScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((value) {
      print('=========sp elements start=======');
      for (var element in value.getKeys()) {
        print('$element = ${value.get(element.toString())}');
      }
      print('=========sp elements end=======');
    });
    SchedulerBinding.instance.addPostFrameCallback(
      (_) async {
////////////////////////////////////////////////////////////////
        try {
          String role = await FirebaseCtrl.getRoleOfUser();
          print('before check role');
          if (role == 'NoAuth' || role == 'NoUser') {
            Navigator.pushReplacementNamed(context, '/welcome');
            print('after all checks with NoAuth or NoUser');
          } else if (role == 'student' || role == 'teacher') {
            SharedPreferences sp = await SharedPreferences.getInstance();
            String path = 'student_photos/${FirebaseAuth.instance.currentUser?.uid}';
            String? profileImagePath = sp.getString('profileImagePath');
            if (!sp.containsKey('profileImageUrl') || !sp.containsKey('profileImagePath') || profileImagePath == null || profileImagePath != path) {
              sp.setString('profileImagePath', path);
              try {
                String? profileImagePath = sp.getString('profileImagePath');
                print('======');
                print(profileImagePath);
                print('======');
                FirebaseStorage storage = FirebaseStorage.instance;
                String? profileImageUrl = await storage.ref(path).child('ProfileImage.png').getDownloadURL();
                print('======');
                print(profileImageUrl);
                print('======');
                sp.setString('profileImageUrl', profileImageUrl);
                print(SharedPreferences.getInstance().then((value) {
                  print('=========sp elements start    =======');
                  for (var element in value.getKeys()) {
                    print('$element = ${value.get(element.toString())}');
                  }
                  print('=========sp elements end    =======');
                }));
              } catch (e) {
                print('get downloadURL and set in sp' + '' + e.toString());
              }
              print('after path == null || path != path');
            }
            if (role == 'student') {
              Navigator.pushReplacementNamed(context, '/student/dashboard', arguments: sp.getString('profileImageUrl'));
            } else if (role == 'teacher') {
              Navigator.pushReplacementNamed(context, '/teacher/dashboard');
            }
            print('after student and teacher checks with $path');
          }
        } on Exception catch (e) {
          print('=====');
          print('error after home body' + '' + e.toString());
          print('=====');
        }
      },
    );
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 5,
        ),
      ),
    );
  }
}
