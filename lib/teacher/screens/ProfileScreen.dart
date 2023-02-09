// ignore_for_file:  , prefer_const_literals_to_create_immutables, sort_child_properties_last, file_names, unnecessary_const

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/resources.dart';
import 'package:shafee_app/services/firebase.dart';

import 'package:shafee_app/shared/TestData.dart';
import 'package:shafee_app/teacher/screens/Attend/Log/LogAttendScreen.dart';
import 'package:shafee_app/teacher/screens/Read/Log/LogReadScreen.dart';
import 'package:shafee_app/teacher/widgets/BottomNavBar.dart';
import 'package:shafee_app/teacher/widgets/CustomAppBarWidget.dart';
import 'package:shafee_app/teacher/widgets/DashboardLayoutCard.dart';
import 'package:shafee_app/teacher/widgets/TextViewBoxWidget.dart';

class TeacherProfileScreen extends StatefulWidget {
  const TeacherProfileScreen({Key? key}) : super(key: key);

  @override
  State<TeacherProfileScreen> createState() => _TeacherProfileScreenState();
}

class _TeacherProfileScreenState extends State<TeacherProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorsData.primaryColor,
      appBar: CustomAppBarWidget(
        mainPageTitle: Text(''),
      ),
      bottomNavigationBar: BottomNavBar(index: 2),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: FutureBuilder(
                future: FirebaseCtrl.getDataOfUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Map data = snapshot.data as Map;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                          data['name'] == '' || data['name'] == null ? 'لا يوجد' : data['name'],
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'حلقة ${data['className'] == '' || data['className'] == null ? 'لا يوجد' : data['className']}',
                          style: TextStyle(fontSize: 16.sp, color: const Color.fromARGB(255, 236, 230, 247)),
                        ),
                      ],
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Expanded(
              flex: 7,
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
                      flex: 5,
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
                                      pageBuilder: (context, animation, secondaryAnimation) => const LogAttendScreen(
                                        name: "name",
                                        studentID: 001,
                                      ),
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
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LogReadScreen(
                                        name: "name",
                                        studentID: 001,
                                      ),
                                    )),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '135',
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
                      ),
                    ),
                    // Expanded(
                    //   flex: 6,
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: DashboardLayoutCards(
                    //           isInkWell: false,
                    //           onTap: () {},
                    //           cardContent: Row(
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               // Expanded(
                    //               //   child: InkWell(
                    //               //     borderRadius: BorderRadius.circular(20.sp),
                    //               //     splashColor: const Color.fromARGB(
                    //               //         255, 236, 230, 247),
                    //               //     highlightColor: Colors.transparent,
                    //               //     hoverColor: Colors.transparent,
                    //               //     onTap: () => Navigator.push(
                    //               //         context,
                    //               //         PageRouteBuilder(
                    //               //           pageBuilder: (context, animation,
                    //               //                   secondaryAnimation) =>
                    //               //               const ProfileScreen(),
                    //               //           transitionDuration:
                    //               //               const Duration(milliseconds: 250),
                    //               //           transitionsBuilder: (context,
                    //               //                   animation,
                    //               //                   secondaryAnimation,
                    //               //                   child) =>
                    //               //               FadeTransition(
                    //               //             opacity: animation,
                    //               //             child: child,
                    //               //           ),
                    //               //         )),
                    //               //     child: Column(
                    //               //       mainAxisAlignment:
                    //               //           MainAxisAlignment.center,
                    //               //       children: [
                    //               //         Text(
                    //               //           "\$53",
                    //               //           style: TextStyle(
                    //               //             fontSize: 24.sp,
                    //               //             fontWeight: FontWeight.w700,
                    //               //             color: const Color.fromARGB(
                    //               //                 255, 98, 71, 170),
                    //               //           ),
                    //               //         ),
                    //               //         Padding(
                    //               //           padding: const EdgeInsets.only(
                    //               //               bottom: 8.0),
                    //               //           child: Text(
                    //               //             'إجمالي مكافآت',
                    //               //             style: TextStyle(
                    //               //                 fontSize: 14.sp,
                    //               //                 fontWeight: FontWeight.w700),
                    //               //           ),
                    //               //         ),
                    //               //       ],
                    //               //     ),
                    //               //   ),
                    //               // ),
                    //               Expanded(
                    //                 child: InkWell(
                    //                   borderRadius:
                    //                       BorderRadius.circular(20.sp),
                    //                   splashColor: const Color.fromARGB(
                    //                       255, 236, 230, 247),
                    //                   highlightColor: Colors.transparent,
                    //                   hoverColor: Colors.transparent,
                    //                   onTap: () => Navigator.push(
                    //                       context,
                    //                       PageRouteBuilder(
                    //                         pageBuilder: (context, animation,
                    //                                 secondaryAnimation) =>
                    //                             const AttendLogScreen(),
                    //                         transitionDuration: const Duration(
                    //                             milliseconds: 250),
                    //                         transitionsBuilder: (context,
                    //                                 animation,
                    //                                 secondaryAnimation,
                    //                                 child) =>
                    //                             FadeTransition(
                    //                           opacity: animation,
                    //                           child: child,
                    //                         ),
                    //                       )),
                    //                   child: Column(
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.center,
                    //                     children: [
                    //                       Text(
                    //                         '32',
                    //                         style: TextStyle(
                    //                           fontSize: 24.sp,
                    //                           fontWeight: FontWeight.w700,
                    //                           color: const Color.fromARGB(
                    //                               255, 98, 71, 170),
                    //                         ),
                    //                       ),
                    //                       Padding(
                    //                         padding: const EdgeInsets.only(
                    //                             bottom: 8.0),
                    //                         child: Text(
                    //                           'أيام الحضور',
                    //                           style: TextStyle(
                    //                               fontSize: 14.sp,
                    //                               fontWeight: FontWeight.w700),
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ),
                    //               Expanded(
                    //                 child: InkWell(
                    //                   borderRadius:
                    //                       BorderRadius.circular(20.sp),
                    //                   splashColor: const Color.fromARGB(
                    //                       255, 236, 230, 247),
                    //                   highlightColor: Colors.transparent,
                    //                   hoverColor: Colors.transparent,
                    //                   onTap: () => Navigator.push(
                    //                       context,
                    //                       MaterialPageRoute(
                    //                           builder: (context) =>
                    //                               const ReadingLogScreen())),
                    //                   child: Column(
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.center,
                    //                     children: [
                    //                       Text(
                    //                         '135',
                    //                         style: TextStyle(
                    //                           fontSize: 24.sp,
                    //                           fontWeight: FontWeight.w700,
                    //                           color: const Color.fromARGB(
                    //                               255, 98, 71, 170),
                    //                         ),
                    //                       ),
                    //                       Padding(
                    //                         padding: const EdgeInsets.only(
                    //                             bottom: 8.0),
                    //                         child: Text(
                    //                           'عدد نقاط',
                    //                           style: TextStyle(
                    //                               fontSize: 14.sp,
                    //                               fontWeight: FontWeight.w700),
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Expanded(
                      flex: 11,
                      child: Row(
                        children: [
                          Expanded(
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
                                        return Column(
                                          children: [
                                            const Expanded(
                                              flex: 2,
                                              child: Center(
                                                child: const Text(
                                                  'بيانات المعلم',
                                                  style:
                                                      TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 128, 128, 128)),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  // TextViewBox(
                                                  //   flex: 1,
                                                  //   fontSize: 15.sp,
                                                  //   labelText: 'تاريخ الإنضمام',
                                                  //   hintText: '15 - 5 - 2022',
                                                  //   enabled: false,
                                                  // ),
                                                  TextViewBox(
                                                    flex: 1,
                                                    fontSize: 15.sp,
                                                    labelText: 'رقم الهاتف',
                                                    hintText: data['PersonalPhone'] == '' || data['PersonalPhone'] == null
                                                        ? 'لا يوجد'
                                                        : data['PersonalPhone'],
                                                    enabled: false,
                                                  ),
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
                                                    labelText: "عدد الطلاب",
                                                    hintText: data['Students'] == '' || data['Students'] == null
                                                        ? "0"
                                                        : ((data['Students']) as List).length.toString(),
                                                    enabled: false,
                                                  ),
                                                  // TextViewBox(
                                                  //   flex: 1,
                                                  //   fontSize: 15.sp,
                                                  //   labelText: 'هاتف الطالب',
                                                  //   hintText: '+962785691009',
                                                  //   enabled: false,
                                                  // ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  // TextViewBox(
                                                  //   flex: 1,
                                                  //   fontSize: 15.sp,
                                                  //   labelText: 'إسم المعلمة',
                                                  //   hintText: 'دعاء كراكر',
                                                  //   enabled: false,
                                                  // ),
                                                  TextViewBox(
                                                    flex: 1,
                                                    fontSize: 15.sp,
                                                    labelText: 'الرقم التسلسلي',
                                                    hintText: data['id'] == '' || data['id'] == null ? 'لا يوجد' : data['id'],
                                                    enabled: false,
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
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Expanded(
                    //   flex: 6,
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: DashboardLayoutCards(
                    //           isInkWell: false,
                    //           onTap: () {},
                    //           cardContent: Column(),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
