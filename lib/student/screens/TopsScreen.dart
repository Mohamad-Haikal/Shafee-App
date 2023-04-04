// ignore_for_file: prefer_const_literals_to_create_immutables,  , file_names, unnecessary_const

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/main.dart';
import 'package:shafee_app/services/auth.dart';
import 'package:shafee_app/student/widgets/BottomNavBar.dart';
import 'package:shafee_app/student/widgets/CustomAppBarWidget.dart';
import 'package:shafee_app/student/widgets/TopsWidget.dart';
import 'package:shafee_app/resources.dart';

import '../../services/firebase.dart';

class TopsScreen extends StatefulWidget {
  const TopsScreen({Key? key}) : super(key: key);

  @override
  State<TopsScreen> createState() => _TopsScreenState();
}

class _TopsScreenState extends State<TopsScreen> {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) async {
        await FirebaseFirestore.instance.collection('users').doc('${AuthCtrl.currentUser()?.uid}').get();
      },
    );
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
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 75),
                        child: FutureBuilder<QuerySnapshot>(
                          future: FirebaseFirestore.instance.collection('users').get(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator());
                            }
                            List<DocumentSnapshot> docs = snapshot.data!.docs;
                            Map usersPoints = {};
                            for (var user in docs) {
                              if ((user.data()! as Map)['role'] == 'student') {
                                List userRecords = (user.data() as Map)['records'];
                                int totalPoints = 0;
                                for (var record in userRecords) {
                                  totalPoints = totalPoints + int.parse(record['points']);
                                }
                                usersPoints.addEntries({(user.data() as Map)['name']: totalPoints}.entries);
                              }
                            }
                            Map sortedUsersPoints = Map.fromEntries(
                              usersPoints.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value)),
                            );
                            return ListView.builder(
                              itemCount: sortedUsersPoints.length,
                              itemBuilder: (context, index) {
                                return TopsWidget(
                                  name: '${sortedUsersPoints.keys.toList()[index]}',
                                  points: int.parse('${sortedUsersPoints.values.toList()[index]}'),
                                  rank: index + 1,
                                );
                              },
                              padding: EdgeInsets.symmetric(horizontal: 20.sp),
                            );
                          },
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
  }
}
