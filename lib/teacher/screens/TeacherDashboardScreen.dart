// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/main.dart';
import 'package:shafee_app/resources.dart';
import 'package:shafee_app/services/firebase.dart';
import 'package:shafee_app/shared/TestData.dart';
import 'package:shafee_app/teacher/screens/AddNewEventScreen.dart';
import 'package:shafee_app/teacher/screens/Attend/Log/LogAttendSelectScreen.dart';
import 'package:shafee_app/teacher/screens/ProfileScreen.dart';
import 'package:shafee_app/teacher/screens/Attend/Add/AddAttendScreen.dart';
import 'package:shafee_app/teacher/screens/Read/Add/AddReadSelectScreen.dart';
import 'package:shafee_app/teacher/screens/Read/Log/LogReadSelectScreen.dart';
import 'package:shafee_app/teacher/widgets/BottomNavBar.dart';
import 'package:shafee_app/teacher/widgets/CustomAppBarWidget.dart';
import 'package:shafee_app/teacher/widgets/DashboardLayoutCard.dart';
import 'package:shafee_app/teacher/widgets/EventWidget.dart';

class TeacherDashboardScreen extends StatefulWidget {
  const TeacherDashboardScreen({Key? key}) : super(key: key);

  @override
  TeacherDashboardScreenState createState() => TeacherDashboardScreenState();
}

class TeacherDashboardScreenState extends State<TeacherDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
          backgroundColor: ColorsData.primaryColor,
          appBar: CustomAppBarWidget(
            mainPageTitle: Text(''),
          ),
          bottomNavigationBar: BottomNavBar(index: MyApp.appbarIndex),
          body: Center(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => const TeacherProfileScreen(),
                          transitionDuration: const Duration(milliseconds: 250),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        ),
                      );
                    },
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: FutureBuilder(
                      future: FirebaseCtrl.getSpecificDataOfCurrentUser('name'),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.sp),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 35.sp,
                                      height: 35.sp,
                                      color: const Color.fromARGB(255, 236, 236, 236),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.cover,
                                      child: Icon(
                                        Icons.person_rounded,
                                        color: Colors.black54,
                                        size: 35.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                snapshot.data.toString(),
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // Text(
                              //   'حلقة المؤنسات الغاليات',
                              //   style: TextStyle(
                              //       fontSize: 16.sp,
                              //       color: const Color.fromARGB(255, 236, 230, 247)),
                              // ),
                            ],
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    padding: EdgeInsets.all(15.0.sp),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.sp),
                        topRight: Radius.circular(20.sp),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: DashboardLayoutCards(
                                  isInkWell: true,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation, secondaryAnimation) => const AddAttendScreen(),
                                        transitionDuration: const Duration(milliseconds: 250),
                                        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        ),
                                      ),
                                    );
                                  },
                                  cardContent: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: 34.sp,
                                        height: 34.sp,
                                        child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: Icon(
                                            Icons.history_edu_rounded,
                                            size: 50.sp,
                                            color: const Color.fromARGB(255, 98, 71, 170),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "إضافة حضور",
                                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 7,
                                child: DashboardLayoutCards(
                                  isInkWell: true,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation, secondaryAnimation) => const AddReadSelectScreen(),
                                        transitionDuration: const Duration(milliseconds: 250),
                                        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        ),
                                      ),
                                    );
                                  },
                                  cardContent: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: 34.sp,
                                        height: 34.sp,
                                        child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: Icon(
                                            Icons.add_task_outlined,
                                            size: 50.sp,
                                            color: const Color.fromARGB(255, 98, 71, 170),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "إضافة تسميع",
                                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              Expanded(
                                child: DashboardLayoutCards(
                                  isInkWell: true,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation, secondaryAnimation) => const LogAttendSelectScreen(),
                                        transitionDuration: const Duration(milliseconds: 250),
                                        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        ),
                                      ),
                                    );
                                  },
                                  cardContent: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: 34.sp,
                                        height: 34.sp,
                                        child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: Icon(
                                            Icons.assignment_ind_outlined,
                                            size: 50.sp,
                                            color: const Color.fromARGB(255, 98, 71, 170),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "سجل الحضور",
                                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: DashboardLayoutCards(
                                  isInkWell: true,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation, secondaryAnimation) => const LogReadSelectScreen(),
                                        transitionDuration: const Duration(milliseconds: 250),
                                        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        ),
                                      ),
                                    );
                                  },
                                  cardContent: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: 34.sp,
                                        height: 34.sp,
                                        child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: Icon(
                                            Icons.task_outlined,
                                            size: 50.sp,
                                            color: const Color.fromARGB(255, 98, 71, 170),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "سجل التسميع",
                                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: DashboardLayoutCards(
                            isInkWell: false,
                            onTap: () {},
                            cardContent: Stack(
                              children: [
                                Swiper(
                                  itemBuilder: (BuildContext context, int index) {
                                    return EventsCard(
                                      eventName: eventsList[index]['eventName'] ?? 'null',
                                      eventDay: eventsList[index]['eventDay'] ?? 'null',
                                      eventMonth: eventsList[index]['eventMonth'] ?? 'null',
                                      eventDayName: eventsList[index]['eventDayName'] ?? 'null',
                                      eventTime: eventsList[index]['eventTime'] ?? 'null',
                                      eventLocation: eventsList[index]['eventLocation'] ?? 'null',
                                    );
                                  },
                                  itemCount: eventsList.length,
                                  physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
                                  loop: false,
                                  scale: 0.8,
                                  curve: Curves.easeInOut,
                                  viewportFraction: 0.8,
                                  pagination: SwiperControl(
                                    color: const Color.fromARGB(255, 112, 112, 112),
                                    size: 15.sp,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation, secondaryAnimation) => const AddNewEventScreen(),
                                          transitionDuration: const Duration(milliseconds: 250),
                                          transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
                                            opacity: animation,
                                            child: child,
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.add_rounded,
                                      color: Color.fromARGB(255, 98, 71, 170),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
