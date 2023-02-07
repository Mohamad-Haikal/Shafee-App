// ignore_for_file:  , prefer_const_literals_to_create_immutables, sort_child_properties_last, file_names, unnecessary_const

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_loading/card_loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/resources.dart';
import 'package:shafee_app/services/authentication.dart';
import 'package:shafee_app/services/firebase.dart';

import 'package:shafee_app/shared/TestData.dart';
import 'package:shafee_app/student/screens/AttendLogScreen.dart';
import 'package:shafee_app/student/screens/ReadingLogScreen.dart';
import 'package:shafee_app/student/widgets/BottomNavBar.dart';
import 'package:shafee_app/student/widgets/CustomAppBarWidget.dart';
import 'package:shafee_app/student/widgets/DashboardLayoutCard.dart';
import 'package:shafee_app/student/widgets/TextViewBoxWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({Key? key}) : super(key: key);

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  late SharedPreferences sp;

  getInstanceOfSp() async {
    sp = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    getInstanceOfSp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorsData.themeColor[2],
      appBar: CustomAppBarWidget(
        mainPageTitle: "",
      ),
      bottomNavigationBar: BottomNavBar(index: 2),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 56),
            alignment: Alignment.topCenter,
            height: 35.h,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/student/profile');
              },
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FutureBuilder(
                    future: FirebaseCtrl.getSpecificDataOfCurrentUser('name'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Stack(
                          fit: StackFit.loose,
                          children: [
                            Container(
                              decoration: BoxDecoration(boxShadow: const [
                                BoxShadow(
                                  blurRadius: 20,
                                )
                              ], borderRadius: BorderRadius.circular(20.sp)),
                              width: 40.sp,
                              height: 40.sp,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.sp),
                                child: CachedNetworkImage(
                                  imageUrl: sp.getString('profileImageUrl') ?? '',
                                  fit: BoxFit.fill,
                                  width: 40.sp,
                                  height: 40.sp,
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      return Opacity(
                        opacity: 0.3,
                        child: CardLoading(
                          height: 35.sp,
                          width: 35.sp,
                          borderRadius: const BorderRadius.all(Radius.circular(25)),
                          margin: const EdgeInsets.only(bottom: 10),
                          cardLoadingTheme: const CardLoadingTheme(
                            colorOne: Color.fromARGB(255, 219, 219, 219),
                            colorTwo: Color.fromARGB(255, 187, 187, 187),
                          ),
                          curve: Curves.easeInOut,
                        ),
                      );
                    },
                  ),
                  FutureBuilder(
                    future: FirebaseCtrl.getSpecificDataOfCurrentUser('name'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data.toString(),
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }
                      return Opacity(
                        opacity: 0.3,
                        child: CardLoading(
                          height: 5.h,
                          width: 20.w,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          margin: const EdgeInsets.only(bottom: 10),
                          cardLoadingTheme: const CardLoadingTheme(
                            colorOne: Color.fromARGB(255, 219, 219, 219),
                            colorTwo: Color.fromARGB(255, 187, 187, 187),
                          ),
                          curve: Curves.easeInOut,
                        ),
                      );
                    },
                  ),

                  // Text(
                  //   'حلقة المؤنسات الغاليات',
                  //   style: TextStyle(
                  //       fontSize: 16.sp,
                  //       color: const Color.fromARGB(255, 236, 230, 247)),
                  // ),
                ],
              ),
            ),
          ),
          SizedBox.expand(
            child: DraggableScrollableSheet(
              initialChildSize: 0.7,
              maxChildSize: 1,
              minChildSize: 0.7,
              snap: true,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.sp), topRight: Radius.circular(20.sp)),
                    color: Colors.white,
                    /*boxShadow: [
                          BoxShadow(color: ColorsData.primaryColor, blurRadius: 15.sp, spreadRadius: 25.sp),
                        ],*/
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.sp), topRight: Radius.circular(20.sp)),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.fromLTRB(10.sp, 10.sp, 10.sp, 0),
                      child: StaggeredGrid.count(
                        axisDirection: AxisDirection.down,
                        crossAxisSpacing: 10.sp,
                        mainAxisSpacing: 10.sp,
                        crossAxisCount: 4,
                        children: widgets(context),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> widgets(BuildContext context) {
  return [
    /* StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 1.5,
        child: DashboardLayoutCards(
          isInkWell: false,
          onTap: () {},
          cardContent: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(20.sp),
                  splashColor: const Color.fromARGB(255, 236, 230, 247),
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () {},
                  // () => Navigator.push(
                  //     context,
                  //     PageRouteBuilder(
                  //       pageBuilder: (context, animation,
                  //               secondaryAnimation) =>
                  //           const ProfileScreen(),
                  //       transitionDuration:
                  //           const Duration(milliseconds: 250),
                  //       transitionsBuilder: (context, animation,
                  //               secondaryAnimation, child) =>
                  //           FadeTransition(
                  //         opacity: animation,
                  //         child: child,
                  //       ),
                  //     )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\$53",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 98, 71, 170),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'إجمالي مكافآت',
                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(20.sp),
                  splashColor: const Color.fromARGB(255, 236, 230, 247),
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => const AttendLogScreen(),
                        transitionDuration: const Duration(milliseconds: 250),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '32',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 98, 71, 170),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'أيام الحضور',
                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(20.sp),
                  splashColor: const Color.fromARGB(255, 236, 230, 247),
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ReadingLogScreen())),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '140',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 98, 71, 170),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'عدد نقاط',
                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
     */
    /* StaggeredGridTile.count(
        crossAxisCellCount: 4,
        mainAxisCellCount: 1.5,
        child: DashboardLayoutCards(
          isInkWell: false,
          onTap: () {},
          cardContent: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Expanded(
              //   child: InkWell(
              //     borderRadius: BorderRadius.circular(20.sp),
              //     splashColor: const Color.fromARGB(
              //         255, 236, 230, 247),
              //     highlightColor: Colors.transparent,
              //     hoverColor: Colors.transparent,
              //     onTap: () => Navigator.push(
              //         context,
              //         PageRouteBuilder(
              //           pageBuilder: (context, animation,
              //                   secondaryAnimation) =>
              //               const ProfileScreen(),
              //           transitionDuration:
              //               const Duration(milliseconds: 250),
              //           transitionsBuilder: (context,
              //                   animation,
              //                   secondaryAnimation,
              //                   child) =>
              //               FadeTransition(
              //             opacity: animation,
              //             child: child,
              //           ),
              //         )),
              //     child: Column(
              //       mainAxisAlignment:
              //           MainAxisAlignment.center,
              //       children: [
              //         Text(
              //           "\$53",
              //           style: TextStyle(
              //             fontSize: 24.sp,
              //             fontWeight: FontWeight.w700,
              //             color: const Color.fromARGB(
              //                 255, 98, 71, 170),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(
              //               bottom: 8.0),
              //           child: Text(
              //             'إجمالي مكافآت',
              //             style: TextStyle(
              //                 fontSize: 14.sp,
              //                 fontWeight: FontWeight.w700),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(20.sp),
                  splashColor: const Color.fromARGB(255, 236, 230, 247),
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => const AttendLogScreen(),
                        transitionDuration: const Duration(milliseconds: 250),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '32',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 98, 71, 170),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'أيام الحضور',
                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(20.sp),
                  splashColor: const Color.fromARGB(255, 236, 230, 247),
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ReadingLogScreen())),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '140',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 98, 71, 170),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'عدد نقاط',
                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
     */
    StaggeredGridTile.count(
        crossAxisCellCount: 4,
        mainAxisCellCount: 3,
        child: DashboardLayoutCards(
          isInkWell: false,
          onTap: () {},
          cardContent: Padding(
            padding: EdgeInsets.all(15.0.sp),
            child: FutureBuilder(
                future: FirebaseCtrl.getDataOfUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Map data = snapshot.data as Map;
                    DocumentReference teacherName = data['teacher'];
                    return Column(
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Center(
                            child: const Text(
                              'بيانات الطالب',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 128, 128, 128)),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextViewBox(flex: 1, fontSize: 15.sp, labelText: 'البريد الإلكتروني', hintText: data['email']),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextViewBox(
                                flex: 1,
                                fontSize: 15.sp,
                                labelText: 'تاريخ الميلاد',
                                hintText: data['Birthday'] == '' || data['Birthday'] == null
                                    ? 'لا يوجد'
                                    : DateFormat('y/d/M').format((data['Birthday'] as Timestamp).toDate()),
                              ),
                              TextViewBox(
                                flex: 1,
                                fontSize: 15.sp,
                                labelText: 'هاتف الطالب',
                                hintText: data['PersonalPhone'] == '' || data['PersonalPhone'] == null ? 'لا يوجد' : data['Teacher'],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FutureBuilder(
                                  future: FirebaseCtrl.getDataOfSpecificUser(uid: teacherName.path),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      Map data = snapshot.data as Map;
                                      return TextViewBox(
                                        flex: 1,
                                        fontSize: 15.sp,
                                        labelText: 'إسم المعلمة',
                                        hintText: data['name'] == '' || data['name'] == null ? 'لا يوجد' : data['name'],
                                      );
                                    }
                                    return TextViewBox(flex: 1, fontSize: 15.sp, labelText: 'إسم المعلمة', hintText: '');
                                  }),
                              TextViewBox(
                                flex: 1,
                                fontSize: 15.sp,
                                labelText: 'الرقم التسلسلي',
                                hintText: data['id'] == '' || data['id'] == null ? 'لا يوجد' : data['id'],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ),
        )),
  ];
}
