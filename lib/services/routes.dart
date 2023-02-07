import 'package:flutter/material.dart';

import 'package:shafee_app/shared/WelcomeScreen.dart';
import 'package:shafee_app/shared/contact_us.dart';
import 'package:shafee_app/shared/home.dart';
import 'package:shafee_app/shared/login_screen.dart';
import 'package:shafee_app/student/screens/AttendLogScreen.dart';
import 'package:shafee_app/student/screens/StudentDashboardScreen.dart';
import 'package:shafee_app/student/screens/ProfileScreen.dart';
import 'package:shafee_app/student/screens/ReadingLogScreen.dart';
import 'package:shafee_app/student/screens/TopsScreen.dart';
import 'package:shafee_app/teacher/screens/AddNewEventScreen.dart';
import 'package:shafee_app/teacher/screens/Attend/Add/AddAttendScreen.dart';
import 'package:shafee_app/teacher/screens/Attend/Log/LogAttendSelectScreen.dart';
import 'package:shafee_app/teacher/screens/TeacherDashboardScreen.dart';
import 'package:shafee_app/teacher/screens/ProfileScreen.dart';
import 'package:shafee_app/teacher/screens/Read/Add/AddReadScreen.dart';
import 'package:shafee_app/teacher/screens/Read/Add/AddReadSelectScreen.dart';
import 'package:shafee_app/teacher/screens/Read/Log/LogReadScreen.dart';
import 'package:shafee_app/teacher/screens/Read/Log/LogReadSelectScreen.dart';
import 'package:shafee_app/teacher/widgets/StudentAttendListSelectWidget.dart';

class RouterCtrl {


  
  static Route<dynamic> returnRoute(Widget screenName) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screenName,
      transitionDuration: Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return returnRoute(const Home());
      case "/login":
        return returnRoute(const LoginScreen());
      case "/welcome":
        return returnRoute(const WelcomeScreen());
      case "/contactUs":
        return returnRoute(const ContactUs());
      case "/student/profile":
        return returnRoute(const StudentProfileScreen());
      case "/student/dashboard":
        return returnRoute(StudentDashboardScreen());
      case "/student/tops":
        return returnRoute(const TopsScreen());
      case "/student/attend/log":
        return returnRoute(const AttendLogScreen());
      case "/student/reading/log":
        return returnRoute(const ReadingLogScreen());
      case "/teacher/profile":
        return returnRoute(const TeacherProfileScreen());
      case "/teacher/dashboard":
        return returnRoute(const TeacherDashboardScreen());
      case "/teacher/eventAdd":
        return returnRoute(const AddNewEventScreen());
      case "/teacher/reading/add":
        return returnRoute(const AddReadScreen(readingType: 0, studentID: 0));
      case "/teacher/reading/add/select":
        return returnRoute(const AddReadSelectScreen());
      case "/teacher/reading/log":
        return returnRoute(const LogReadScreen(name: "", studentID: 0));
      case "/teacher/reading/log/select":
        return returnRoute(const LogReadSelectScreen());
      case "/teacher/reading/log/select/details":
        return returnRoute(const StudentAttendListSelectWidget(name: "", studentID: 0));
      case "/teacher/attend/add":
        return returnRoute(const AddAttendScreen());
      case "/teacher/attend/add/select":
        return returnRoute(const AddReadSelectScreen());
      case "/teacher/attend/log":
        return returnRoute(const AttendLogScreen());
      case "/teacher/attend/log/select":
        return returnRoute(const LogAttendSelectScreen());
      default:
        return MaterialPageRoute(builder: (context) => const Home());
    }
  }
}
