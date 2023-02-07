// ignore_for_file:  , sort_child_properties_last, camel_case_types, must_be_immutable, file_names

// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/main.dart';
import 'package:shafee_app/teacher/screens/TeacherDashboardScreen.dart';
import 'package:shafee_app/teacher/screens/ProfileScreen.dart';
import 'package:shafee_app/teacher/screens/Read/Log/LogReadScreen.dart';

// import 'package:shafee_app/teacher/screens/DashboardScreen.dart';
// import 'package:shafee_app/teacher/screens/ProfileScreen.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
        // BottomNavigationBarItem(
        //   icon: Icon(
        //     Icons.event_outlined,
        //     color: Color.fromARGB(255, 98, 71, 170),
        //   ),
        //   activeIcon: Icon(
        //     Icons.event,
        //     color: Color.fromARGB(255, 98, 71, 170),
        //   ),
        //   label: "الأحداث",
        // ),
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
            Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const TeacherProfileScreen(),
                  transitionDuration: const Duration(milliseconds: 250),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                ),
                (Route<dynamic> route) => false);
            break;
          case 1:
            // Navigator.pushAndRemoveUntil(
            //     context,
            //     PageRouteBuilder(
            //       pageBuilder: (context, animation, secondaryAnimation) =>
            //           const TopsScreen(),
            //       transitionDuration: const Duration(milliseconds: 250),
            //       transitionsBuilder:
            //           (context, animation, secondaryAnimation, child) =>
            //               FadeTransition(
            //         opacity: animation,
            //         child: child,
            //       ),
            //     ),
            //     (Route<dynamic> route) => false);
            break;
          case 2:
            Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const TeacherDashboardScreen(),
                  transitionDuration: const Duration(milliseconds: 250),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                ),
                (Route<dynamic> route) => false);
            break;
          // case 3:
          //   Navigator.pushAndRemoveUntil(
          //       context,
          //       PageRouteBuilder(
          //         pageBuilder: (context, animation, secondaryAnimation) =>
          //             const ProfileScreen(),
          //         transitionDuration: const Duration(milliseconds: 250),
          //         transitionsBuilder:
          //             (context, animation, secondaryAnimation, child) =>
          //                 FadeTransition(
          //           opacity: animation,
          //           child: child,
          //         ),
          //       ),
          //       (Route<dynamic> route) => false);
          //   break;
          case 4 - 1:
            Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const LogReadScreen(
                    name: "name",
                    studentID: 00001,
                  ),
                  transitionDuration: const Duration(milliseconds: 250),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                ),
                (Route<dynamic> route) => false);
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
    );
    //   return CurvedNavigationBar(
    //     animationDuration: const Duration(milliseconds: 350),
    //     index: index,
    //     backgroundColor: Colors.transparent,
    //     animationCurve: Curves.easeInOut,
    //     items: [
    //       Icon(Icons.emoji_events_outlined, color: Color.ARGB(255,98, 71, 170)),
    //       Icon(Icons.event, color: Color.ARGB(255,98, 71, 170)),
    //       Icon(Icons.home_outlined, color: Color.ARGB(255,98, 71, 170)),
    //       Icon(Icons.history, color: Color.ARGB(255,98, 71, 170)),
    //       Icon(Icons.person_outline_rounded, color: Color.ARGB(255,98, 71, 170)),
    //     ],
    //     onTap: (index) {
    //       switch (index) {
    //         case 0:
    //           break;
    //         case 1:
    //           break;
    //         case 2:
    //           refreshContent(ProfileScreen(), "");
    //           break;
    //         case 3:
    //           break;
    //         case 4:
    //           break;
    //         default:
    //       }
    //     },
    //   );
  }
}
