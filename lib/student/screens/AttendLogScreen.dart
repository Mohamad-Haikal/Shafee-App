// ignore_for_file: prefer_const_literals_to_create_immutables,  , file_names

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/resources.dart';
import 'package:shafee_app/shared/TestData.dart';

import 'package:shafee_app/student/widgets/AttendWidget.dart';
import 'package:shafee_app/student/widgets/BottomNavBar.dart';
import 'package:shafee_app/student/widgets/CustomAppBarWidget.dart';

class AttendLogScreen extends StatefulWidget {
  const AttendLogScreen({Key? key}) : super(key: key);

  @override
  State<AttendLogScreen> createState() => _AttendLogScreenState();
}

class _AttendLogScreenState extends State<AttendLogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
          backgroundColor: ColorsData.themeColor[2],
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
                    'سجل الحضور',
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
                    Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'الحضور :',
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black, fontFamily: 'Cairo'),
                            children: <TextSpan>[
                              TextSpan(
                                text: 93.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 98, 71, 170),
                                  fontFamily: 'Cairo',
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'الغياب بعذر :',
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black, fontFamily: 'Cairo'),
                            children: <TextSpan>[
                              TextSpan(
                                text: 5.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 98, 71, 170),
                                  fontFamily: 'Cairo',
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'الغياب بغير عذر :',
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black, fontFamily: 'Cairo'),
                            children: <TextSpan>[
                              TextSpan(
                                text: 5.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 98, 71, 170),
                                  fontFamily: 'Cairo',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return AttendWidget(
                            attendDay: attendElements[index]['values']["date"]["day"],
                            attendDayName: attendElements[index]['values']["date"]["dayName"],
                            attendMonthName: attendElements[index]['values']["date"]["monthName"],
                            attendStatue: int.parse(attendElements[index]["values"]["attendStatue"]),
                          );
                        },
                        itemCount: attendElements.length,
                        physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
                        loop: false,
                        scale: 0.6,
                        curve: Curves.easeInOut,
                        viewportFraction: 0.29,
                        scrollDirection: Axis.vertical,
                        pagination: const SwiperControl(
                          color: Color.fromARGB(255, 112, 112, 112),
                          size: 20,
                        ),
                        index: 4,
                      ),
                    )),
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
