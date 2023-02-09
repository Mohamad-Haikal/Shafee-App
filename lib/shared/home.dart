// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shafee_app/services/firebase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) async {
        try {
          String role = await FirebaseCtrl.getRoleOfUser();

          if (role == 'NoAuth' || role == 'NoUser') {
            Navigator.pushReplacementNamed(context, '/welcome');
          } else if (role == 'student' || role == 'teacher') {
            SharedPreferences sp = await SharedPreferences.getInstance();
            String path = 'student_photos/${FirebaseAuth.instance.currentUser?.uid}';
            FirebaseStorage storage = FirebaseStorage.instance;
            String? profileImagePath = sp.getString('profileImagePath');

            if (!sp.containsKey('profileImageUrl') || !sp.containsKey('profileImagePath') || profileImagePath == null || profileImagePath != path) {
              sp.setString('profileImagePath', path);

              try {
                String? profileImageUrl = await storage.ref(path).child('ProfileImage.png').getDownloadURL();
                sp.setString('profileImageUrl', profileImageUrl);
              } catch (e) {
                print('downloadURL error:  $e');
              }
            }
            if (role == 'student') {
              Navigator.pushReplacementNamed(
                context,
                '/student/dashboard',
              );
            } else if (role == 'teacher') {
              Navigator.pushReplacementNamed(context, '/teacher/dashboard');
            }
          }
        } on Exception catch (e) {
          print('error after home body: $e');
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
