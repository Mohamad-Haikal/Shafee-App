// ignore_for_file: prefer_const_literals_to_create_immutables,  , file_names

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/main.dart';
import 'package:shafee_app/services/auth.dart';
import 'package:shafee_app/student/widgets/BottomNavBar.dart';
import 'package:shafee_app/student/widgets/CustomAppBarWidget.dart';
import 'package:shafee_app/student/widgets/ReadingLogListElementWidget.dart';
import 'package:shafee_app/resources.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

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
                  FutureBuilder(
                      future: FirebaseFirestore.instance.collection('users').doc('${AuthCtrl.currentUser()?.uid}').get(),
                      builder: (context, doc) {
                        if (doc.hasData && !doc.hasError) {
                          return Expanded(
                            child: ListView.builder(
                              padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                              itemCount: (((doc.data as DocumentSnapshot).data() as Map)['records'] as List).length,
                              itemBuilder: (context, index) {
                                var data = ((((doc.data as DocumentSnapshot).data() as Map)['records'] as List)[index] as Map);
                                return ReadingLogListElementWidget(
                                  recordId: data['id'],
                                  statueColor:
                                      data['isDone'] == true ? const Color.fromARGB(255, 38, 166, 154) : const Color.fromARGB(255, 226, 112, 112),
                                  points: data['points'],
                                  date: DateFormat("MM/dd").format((data['date'] as Timestamp).toDate()).toString(),
                                  title: data['title'],
                                );
                              },
                            ),
                          );
                        }
                        return Expanded(
                            flex: 9,
                            child: Stack(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                                    itemCount: 9,
                                    itemBuilder: (context, index) {
                                      return Shimmer(
                                        color: Colors.white,
                                        colorOpacity: 0.9,
                                        child: const ReadingLogListElementWidget(
                                          recordId: '',
                                          statueColor: Color.fromARGB(255, 255, 255, 255),
                                          points: '',
                                          date: '',
                                          title: '',
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(20.sp),
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 5,
                                  ),
                                )
                              ],
                            ));
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
