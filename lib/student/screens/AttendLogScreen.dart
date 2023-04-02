// ignore_for_file: prefer_const_literals_to_create_immutables,  , file_names

import 'package:card_loading/card_loading.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/resources.dart';
import 'package:shafee_app/services/auth.dart';
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
                child: FutureBuilder(
                    future: FirebaseFirestore.instance.collection('users').doc('${AuthCtrl.currentUser()?.uid}').get(),
                    builder: (context, doc) {
                      if (doc.hasData) {
                        List present = [];
                        List notPresent = [];
                        List notPresentNoReason = [];
                        for (var attend in (((doc.data as DocumentSnapshot).data() as Map)['attends'] as List)) {
                          switch ((attend as Map)['status']) {
                            case 0:
                              notPresentNoReason.add(attend);
                              break;
                            case 1:
                              notPresent.add(attend);
                              break;
                            case 2:
                              present.add(attend);
                              break;
                            default:
                          }
                        }
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'الحضور :',
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black, fontFamily: 'Cairo'),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: present.length.toString(),
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
                                        text: notPresent.length.toString(),
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
                                        text: notPresentNoReason.length.toString(),
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
                              child: Swiper.children(
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
                                children: List.generate(
                                    (((doc.data as DocumentSnapshot).data() as Map)['attends'] as List).length,
                                    (index) => AttendWidget(
                                        timeStamp: ((((doc.data as DocumentSnapshot).data() as Map)['attends'] as List)[index] as Map)['TimeStamp']
                                            as Timestamp,
                                        attendStatue: ((((doc.data as DocumentSnapshot).data() as Map)['attends'] as List)[index] as Map)['status']
                                            .toString())),
                              ),
                            )),
                          ],
                        );
                      } else {
                        return Expanded(
                            child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.sp),
                          child: Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return CardLoading(
                                height: 300,
                                borderRadius: BorderRadius.circular(25.sp),
                              );
                            },
                            itemCount: 3,
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
                            index: 1,
                          ),
                        ));
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
