// ignore_for_file:  , sort_child_properties_last, camel_case_types, must_be_immutable, file_names

// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/main.dart';
import 'package:shafee_app/student/screens/StudentDashboardScreen.dart';
import 'package:shafee_app/student/screens/ProfileScreen.dart';
import 'package:shafee_app/student/screens/ReadingLogScreen.dart';
import 'package:shafee_app/student/screens/TopsScreen.dart';

// import 'package:shafee_app/student/screens/StudentDashboardScreen.dart';
// import 'package:shafee_app/student/screens/ProfileScreen.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    /*return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_outlined,
            color: Color.fromARGB(255, 98, 71, 170),
          ),
          activeIcon: Icon(
            Icons.person,
            color: Color.fromARGB(255, 98, 71, 170),
          ),
          label: "الملف الشخصي",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.emoji_events_outlined,
            color: Color.fromARGB(255, 98, 71, 170),
          ),
          activeIcon: Icon(
            Icons.emoji_events,
            color: Color.fromARGB(255, 98, 71, 170),
          ),
          label: "الأوائل",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
            color: Color.fromARGB(255, 98, 71, 170),
          ),
          activeIcon: Icon(
            Icons.home,
            color: Color.fromARGB(255, 98, 71, 170),
          ),
          label: "الرئيسية",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.event_outlined,
            color: Color.fromARGB(255, 98, 71, 170),
          ),
          activeIcon: Icon(
            Icons.event,
            color: Color.fromARGB(255, 98, 71, 170),
          ),
          label: "الأحداث",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.history_outlined,
            color: Color.fromARGB(255, 98, 71, 170),
          ),
          activeIcon: Icon(
            Icons.history,
            color: Color.fromARGB(255, 98, 71, 170),
          ),
          label: "سجل التسميع",
        ),
      ],
      elevation: 10,
      currentIndex: MyApp.appbarIndex,
      onTap: (value) {
        switch (value) {
          case 0:
            Navigator.pushNamed(
                context,
                "/student/profile");
            break;
          case 1:
            Navigator.pushNamed(
                context,
                "/student/top");
            break;
          case 2:
            Navigator.pushNamed(
                context,
                "/student/dashboard");
            break;
          case 3:
            Navigator.pushNamed(
                context,
                "/student/proflie");
            break;
          
          default:
        }
        setState(() {
          widget.index = value;
          MyApp.appbarIndex = value;
        });
      },
      selectedItemColor: const Color.fromARGB(255, 68, 68, 68),
      selectedLabelStyle: TextStyle(
        fontFamily: 'cairo',
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      showUnselectedLabels: false,
    );*/
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 30, blurRadius: 20, offset: Offset(0, 5)),
        ],
      ),
      child: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 350),
        index: MyApp.appbarIndex,
        animationCurve: Curves.easeInOut,
        items: const [
          Icon(Icons.event, color: Color.fromARGB(255, 98, 71, 170)),
          Icon(Icons.emoji_events_outlined, color: Color.fromARGB(255, 98, 71, 170)),
          Icon(Icons.home_outlined, color: Color.fromARGB(255, 98, 71, 170)),
          // Icon(Icons.history, color: Color.fromARGB(255,98, 71, 170)),
          Icon(Icons.person_outline_rounded, color: Color.fromARGB(255, 98, 71, 170)),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              MyApp.appbarIndex = index;
              Navigator.pushNamedAndRemoveUntil(context, "/student/profile", (route) => false);
              break;
            case 1:
              MyApp.appbarIndex = index;
              Navigator.pushNamedAndRemoveUntil(context, "/student/tops", (route) => false);
              break;
            case 2:
              MyApp.appbarIndex = index;
              Navigator.pushNamedAndRemoveUntil(context, "/student/dashboard", (route) => false);
              break;
            case 3:
              MyApp.appbarIndex = index;
              Navigator.pushNamedAndRemoveUntil(context, "/student/profile", (route) => false);
              break;
            default:
          }
        },
      ),
    );
  }
}
