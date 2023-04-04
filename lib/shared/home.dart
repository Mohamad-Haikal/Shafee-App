// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shafee_app/services/auth.dart';
import 'package:shafee_app/services/firebase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) async {
        SharedPreferences sp = await SharedPreferences.getInstance();
        String role = await FirebaseCtrl.getRoleOfUser();
        if (role == 'NoAuth' || role == 'NoUser') {
          Navigator.pushReplacementNamed(context, '/welcome');
        } else if (role == 'student' || role == 'teacher') {
          String path = 'student_photos/${AuthCtrl.currentUser()?.uid}';
          String? profileImagePath = sp.getString('profileImagePath');
          if (!sp.containsKey('profileImageUrl') || !sp.containsKey('profileImagePath') || profileImagePath == null || profileImagePath != path) {
            sp.setString('profileImagePath', path);
            FirebaseStorage storage = FirebaseStorage.instance;
            String? profileImageUrl;
            await storage
                .ref(path)
                .child('ProfileImage.png')
                .getDownloadURL()
                .onError((error, stackTrace) => profileImageUrl = 'error')
                .then((value) => {profileImageUrl = value});
            print(profileImageUrl);
            if (profileImageUrl != null || profileImageUrl != 'error') {
              sp.setString('profileImageUrl', profileImageUrl!);
            }
          }
          if (role == 'student') {
            Navigator.pushReplacementNamed(context, '/student/dashboard', arguments: sp.getString('profileImageUrl'));
          } else if (role == 'teacher') {
            Navigator.pushReplacementNamed(context, '/teacher/dashboard');
          }
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
