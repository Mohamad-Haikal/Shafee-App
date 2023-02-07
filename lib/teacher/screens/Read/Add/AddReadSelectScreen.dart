// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/resources.dart';
import 'package:shafee_app/shared/TestData.dart';
import 'package:shafee_app/teacher/widgets/BottomNavBar.dart';
import 'package:shafee_app/teacher/widgets/CustomAppBarWidget.dart';
import 'package:group_button/group_button.dart';
import 'package:shafee_app/teacher/widgets/Read/AddReadSelectWidget.dart';
import 'package:intl/intl.dart';

class AddReadSelectScreen extends StatefulWidget {
  const AddReadSelectScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddReadSelectScreen> createState() => _AddReadSelectScreenState();
}

class _AddReadSelectScreenState extends State<AddReadSelectScreen> {
  int readingType = 2;
  int yesOrNoGroup = 1;
  double starRateValue = 0;
  GroupButtonController readingTypeCtrl = GroupButtonController(selectedIndex: 2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
extendBody: true,
          backgroundColor: ColorsData.themeColor[2],       appBar: CustomAppBarWidget(
        mainPageTitle: "",
      ),
      bottomNavigationBar: BottomNavBar(index: 2),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'إختيار الطالب',
                  style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w800, color: const Color.fromARGB(255, 236, 230, 247)),
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
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Form(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 14,
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return AddReadSelectWidget(
                                    name: studentsList[NumberFormat("000").format(index + 1)]["name"],
                                    studentID: index,
                                  );
                                },
                                itemCount: studentsList.length,
                                padding: EdgeInsets.symmetric(horizontal: 30.sp, vertical: 10.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
