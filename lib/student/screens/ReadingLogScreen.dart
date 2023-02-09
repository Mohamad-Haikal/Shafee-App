// ignore_for_file: prefer_const_literals_to_create_immutables,  , file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/main.dart';
import 'package:shafee_app/student/widgets/BottomNavBar.dart';
import 'package:shafee_app/student/widgets/CustomAppBarWidget.dart';
import 'package:shafee_app/student/widgets/ReadingLogListElementWidget.dart';
import 'package:shafee_app/resources.dart';

class ReadingLogScreen extends StatefulWidget {
  const ReadingLogScreen({Key? key}) : super(key: key);

  @override
  State<ReadingLogScreen> createState() => _ReadingLogScreenState();
}

class _ReadingLogScreenState extends State<ReadingLogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorsData.primaryColor,
      appBar: CustomAppBarWidget(
        mainPageTitle: "",
      ),
      bottomNavigationBar: BottomNavBar(index: 2),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'سجل التسميع',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 236, 230, 247)),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 9,
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
                      textDirection: TextDirection.rtl,
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
                        return ReadingLogListElementWidget(
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
