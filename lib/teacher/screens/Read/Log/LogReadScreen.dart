// ignore_for_file: prefer_const_literals_to_create_immutables,  , file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/main.dart';
import 'package:shafee_app/shared/TestData.dart';
import 'package:shafee_app/teacher/widgets/BottomNavBar.dart';
import 'package:shafee_app/teacher/widgets/CustomAppBarWidget.dart';
import 'package:shafee_app/teacher/widgets/StudentListSelectWidgetold.dart';
import 'package:shafee_app/resources.dart';

class LogReadScreen extends StatefulWidget {
  final String name;
  final int studentID;
  const LogReadScreen({Key? key, required this.name, required this.studentID}) : super(key: key);

  @override
  State<LogReadScreen> createState() => _LogReadScreenState();
}

class _LogReadScreenState extends State<LogReadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: ColorsData.primaryColor,
      appBar: CustomAppBarWidget(
        mainPageTitle: Text(''),
      ),
      bottomNavigationBar: BottomNavBar(index: 2),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'سجل التسميع',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 236, 230, 247)),
                ),
                Text(
                  "الطالب : ${studentsList[NumberFormat("000").format(widget.studentID + 1)]["name"]}",
                  style: TextStyle(color: const Color.fromARGB(255, 236, 230, 247), fontSize: 15.sp),
                ),
                Text(
                  "الرقم التعريفي : ${NumberFormat("000").format(widget.studentID + 1)}",
                  style: TextStyle(color: const Color.fromARGB(255, 236, 230, 247), fontSize: 13.sp),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 12,
            child: Card(
              margin: EdgeInsets.zero,
              color: const Color.fromARGB(255, 236, 230, 247),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.sp), topRight: Radius.circular(20.sp)),
              ),
              child: Column(
                children: [
                  Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    elevation: 0,
                    child: Row(
                      // textDirection: TextDirection.RTL,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              'النقاط',
                              style: TextStyle(
                                fontSize: 13,
                                color: ColorsData.themeColor[3],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                          child: VerticalDivider(
                            thickness: 1,
                            width: 5,
                            indent: 10,
                            endIndent: 10,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              'التاريخ',
                              style: TextStyle(
                                fontSize: 13,
                                color: ColorsData.themeColor[3],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                          child: VerticalDivider(
                            thickness: 1,
                            width: 5,
                            indent: 10,
                            endIndent: 10,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: Text(
                              'الوصف',
                              style: TextStyle(
                                fontSize: 13,
                                color: ColorsData.themeColor[3],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return StudentListSelectWidgetold(
                          circleColor: index % 2 == 0 ? const Color.fromARGB(255, 38, 166, 154) : const Color.fromARGB(255, 226, 112, 112),
                          points: Random().nextInt(17) - 17,
                          date: '10/03',
                          discription: '${Random().nextInt(30) + 1}سرد ومراجعة الجزء ال',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
