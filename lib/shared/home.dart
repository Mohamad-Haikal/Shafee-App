// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:shafee_app/main.dart';
import 'package:shafee_app/services/firebase.dart';
import 'package:shafee_app/shared/WelcomeScreen.dart';
import 'package:shafee_app/student/screens/StudentDashboardScreen.dart';
import 'package:shafee_app/teacher/screens/TeacherDashboardScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) async {
////////////////////////////////////////////////////////////////
        String role = await FirebaseCtrl.getRoleOfUser();
        print('before check role');
        if (role == 'NoAuth') {
          Navigator.pushReplacementNamed(context, '/welcome');
        }
        if (role == 'NoUser') {
          Navigator.pushReplacementNamed(context, '/welcome');
        }
        SharedPreferences sp = await SharedPreferences.getInstance();
        String path = 'student_photos/${FirebaseAuth.instance.currentUser?.uid}/ProfileImage.png';

        if (role == 'student' || role == 'teacher') {
          if (sp.getString('profileImagePath') == null || sp.getString('profileImagePath') != path) {
            sp.setString('profileImagePath', path);
            try {
              sp.setString('profileImageUrl', await FirebaseStorage.instance.ref().child('${sp.getString('profileImagePath')}').getDownloadURL());
            } catch (e) {
              print(e);
            }
            MyApp.profileImageUrl = path;
            print('after path == null || path != path');
          }
          if (role == 'student') {
            Navigator.pushReplacementNamed(context, '/student/dashboard');
          }
          if (role == 'teacher') {
            Navigator.pushReplacementNamed(context, '/teacher/dashboard');
          }
        }

        print('after all checks with $path');
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
