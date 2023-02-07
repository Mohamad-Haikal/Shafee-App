// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/resources.dart';
import 'package:shafee_app/teacher/screens/Read/Log/LogReadScreen.dart';

class LogReadSelectWidget extends StatelessWidget {
  final String name;
  final int studentID;
  static List<Color> listOfColor = [
    const Color(0xFF8DB9B5),
    const Color(0xFF89A5B3),
    const Color(0xFFC09689),
    const Color(0xFF937DB9),
    const Color(0xFF7E87B6),
    const Color(0xFFBB8194),
  ];
  const LogReadSelectWidget({Key? key, required this.name, required this.studentID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => LogReadScreen(
                  name: name,
                  studentID: studentID,
                ),
                transitionDuration: const Duration(milliseconds: 250),
                transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              ));
        },
        child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.sp),
          ),
          color: const Color.fromARGB(255, 255, 255, 255),
          elevation: 10,
          child: Container(
            alignment: Alignment.center,
            height: 35.sp,
            child: Text(
              name,
              style: TextStyle(
                color: ColorsData.primaryColor,
                fontWeight: FontWeight.w800,
                fontSize: 18.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
