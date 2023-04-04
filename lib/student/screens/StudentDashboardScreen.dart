// ignore_for_file: file_names, avoid_print
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/scheduler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/main.dart';
import 'package:shafee_app/resources.dart';
import 'package:shafee_app/services/auth.dart';
import 'package:shafee_app/services/firebase.dart';
import 'package:shafee_app/shared/TestData.dart';
import 'package:shafee_app/student/widgets/BottomNavBar.dart';
import 'package:shafee_app/student/widgets/CustomAppBarWidget.dart';
import 'package:shafee_app/student/widgets/DashboardLayoutCard.dart';
import 'package:shafee_app/student/widgets/EventWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class StudentDashboardScreen extends StatefulWidget {
  const StudentDashboardScreen({super.key});

  @override
  StudentDashboardScreenState createState() => StudentDashboardScreenState();
}

class StudentDashboardScreenState extends State<StudentDashboardScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  late SharedPreferences sp;

  var name = FirebaseCtrl.getSpecificDataOfCurrentUser('name');

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        sp = await SharedPreferences.getInstance();
        final DocumentSnapshot<Map<String, dynamic>> attendSnapshot =
            await FirebaseFirestore.instance.collection('users').doc('${AuthCtrl.currentUser()?.uid}').get();
      },
    );

    return ResponsiveSizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          extendBody: true,
          backgroundColor: ColorsData.primaryColor,
          appBar: CustomAppBarWidget(
            mainPageTitle: "",
          ),
          bottomNavigationBar: BottomNavBar(index: MyApp.appbarIndex),
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
                                      // cacheKey: 'ProfileImage',
                                      imageUrl: '${sp.getString('profileImageUrl')}',
                                      placeholder: (context, url) {
                                        return Opacity(
                                          opacity: 0.3,
                                          child: CardLoading(
                                            height: 40.sp,
                                            width: 40.sp,
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
                                      errorWidget: (context, url, error) => Container(
                                        color: const Color.fromARGB(255, 255, 255, 255),
                                        child: Icon(
                                          Icons.person,
                                          size: 40.sp,
                                          color: const Color.fromARGB(255, 139, 139, 139),
                                        ),
                                      ),
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
      },
    );
  }
}

List<Widget> widgets(
  BuildContext context,
) {
  return [
    StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 1.75,
      child: DashboardLayoutCards(
        isInkWell: true,
        onTap: () {
          Navigator.pushNamed(context, '/student/tops');
        },
        cardContent: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Shimmer(
                    duration: const Duration(seconds: 2),
                    interval: const Duration(seconds: 0),
                    colorOpacity: 0.65,
                    child: SizedBox(
                      height: 35.sp,
                      width: 35.sp,
                      child: Container(
                        height: 35.sp,
                        width: 35.sp,
                        decoration: BoxDecoration(
                          // color: Colors.amber.shade500,
                          // color: Colors.grey.shade500,
                          borderRadius: BorderRadius.circular(16.sp),
                          border: Border.all(width: 14.sp, color: Colors.amber.shade600),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  '1',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28.sp, color: Colors.grey.shade800),
                )
              ],
            ),
            Text(
              "أوائل التسميع",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
              maxLines: 1,
            ),
          ],
        ),
        // child: Column(
        //   children: [
        //     Expanded(
        //       flex: 4,
        //       child: Center(
        //         child: Text(
        //           '75',
        //           style: TextStyle(
        //             fontSize: 65,
        //             fontWeight: FontWeight.w700,
        //             height: 1.5,
        //           ),
        //         ),
        //       ),
        //     ),
        //     Expanded(
        //       flex: 1,
        //       child: Container(
        //           alignment: Alignment.center,
        //           child: Text('نقطة هذا الأسبوع')),
        //     ),
        //     Expanded(
        //       flex: 2,
        //       child: Container(
        //         width: 150,
        //         child: Progresso(
        //           backgroundColor: Colors.black26,
        //           progressColor: Color.ARGB(255,98, 71, 170),
        //           progress: 0.75,
        //           backgroundStrokeCap: StrokeCap.round,
        //           backgroundStrokeWidth: 13,
        //           progressStrokeWidth: 13,
        //           progressStrokeCap: StrokeCap.round,
        //         ),
        //       ),
        //     )
        //   ],
        // ),
      ),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 1.75,
      child: DashboardLayoutCards(
        isInkWell: true,
        onTap: () {
          Navigator.pushNamed(context, '/student/attend/log');
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
                  Icons.history,
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
    StaggeredGridTile.count(
      crossAxisCellCount: 4,
      mainAxisCellCount: 1.75,
      child: DashboardLayoutCards(
        isInkWell: true,
        onTap: () {
          Navigator.pushNamed(context, '/student/reading/log');
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
                  Icons.format_list_bulleted_rounded,
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
    StaggeredGridTile.count(
      crossAxisCellCount: 4,
      mainAxisCellCount: 2.75,
      child: DashboardLayoutCards(
        isInkWell: false,
        onTap: () {},
        cardContent: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return EventsCard(
              backgroundColor: ColorsData.eventColors[index % ColorsData.eventColors.length],
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
      ),
    ),
  ];
}
