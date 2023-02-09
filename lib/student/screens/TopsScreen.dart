// ignore_for_file: prefer_const_literals_to_create_immutables,  , file_names, unnecessary_const

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/main.dart';
import 'package:shafee_app/student/widgets/BottomNavBar.dart';
import 'package:shafee_app/student/widgets/CustomAppBarWidget.dart';
import 'package:shafee_app/student/widgets/TopsWidget.dart';
import 'package:shafee_app/resources.dart';

class TopsScreen extends StatefulWidget {
  const TopsScreen({Key? key}) : super(key: key);

  @override
  State<TopsScreen> createState() => _TopsScreenState();
}

class _TopsScreenState extends State<TopsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorsData.primaryColor,
      appBar: CustomAppBarWidget(
        mainPageTitle: "",
      ),
      bottomNavigationBar: BottomNavBar(index: 2),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'أوائل التسميع',
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
                        itemBuilder: (context, index) {
                          return <TopsWidget>[
                            TopsWidget(
                              name: 'محمد هيكل',
                              rank: 1,
                            ),
                            TopsWidget(
                              name: 'محمود أحمد',
                              rank: 2,
                            ),
                            TopsWidget(
                              name: 'محمد معاذ',
                              rank: 3,
                            ),
                            TopsWidget(
                              name: 'نور محمود',
                              rank: 4,
                            ),
                            TopsWidget(
                              name: 'محمود حمد',
                              rank: 5,
                            ),
                            TopsWidget(
                              name: 'حمد حامد',
                              rank: 6,
                            ),
                            TopsWidget(
                              name: ' اسماعيل نور',
                              rank: 7,
                            ),
                            TopsWidget(
                              name: 'خالد اسماعيل',
                              rank: 8,
                            ),
                            TopsWidget(
                              name: 'حمد ثابت',
                              rank: 9,
                            ),
                            TopsWidget(
                              name: 'ثابت خالد',
                              rank: 10,
                            ),
                            TopsWidget(
                              name: 'ثابت خالد',
                              rank: 11,
                            ),
                            TopsWidget(
                              name: 'ثابت خالد',
                              rank: 12,
                            ),
                            TopsWidget(
                              name: 'ثابت خالد',
                              rank: 13,
                            ),
                            TopsWidget(
                              name: 'ثابت خالد',
                              rank: 14,
                            ),
                          ][index];
                        },
                        itemCount: 14,
                        padding: EdgeInsets.symmetric(horizontal: 20.sp),
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
  }
}
