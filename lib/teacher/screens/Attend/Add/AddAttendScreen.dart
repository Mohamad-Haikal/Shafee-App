// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/resources.dart';
import 'package:shafee_app/shared/TestData.dart';
import 'package:shafee_app/teacher/widgets/BottomNavBar.dart';
import 'package:shafee_app/teacher/widgets/CustomAppBarWidget.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

class AddAttendScreen extends StatefulWidget {
  const AddAttendScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddAttendScreen> createState() => _AddAttendScreenState();
}

class _AddAttendScreenState extends State<AddAttendScreen> {
  MultiSelectController studentsCheckListCRTL = MultiSelectController();
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
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
                  'إختيار الطلاب',
                  style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w800, color: const Color.fromARGB(255, 236, 230, 247)),
                ),
                Text(
                  'تاريخ اليوم : ${DateFormat('yyyy/MM/dd').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day))}',
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 236, 230, 247)),
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              studentsCheckListCRTL.deselectAll();
                            },
                            icon: const Icon(Icons.remove_done_rounded),
                            tooltip: "الغاء تحديد الكل"),
                        IconButton(
                            onPressed: () {
                              studentsCheckListCRTL.selectAll();
                            },
                            icon: const Icon(Icons.done_all_rounded),
                            tooltip: "تحديد الكل"),
                      ],
                    ),
                    Expanded(
                      flex: 14,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(18.0.sp),
                          child: MultiSelectCheckList(
                            controller: studentsCheckListCRTL,
                            items: List.generate(
                              studentsList.length,
                              (index) => CheckListCard(
                                value: "${studentsList[NumberFormat("000").format(index + 1)]}",
                                title: Center(
                                  child: Text(
                                    "${studentsList[NumberFormat("000").format(index + 1)]["name"]}",
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                  ),
                                ),
                                enabledColor: ColorsData.primaryColor,
                              ),
                            ),
                            onChange: (allSelectedItems, selectedItem) {},
                            textStyles: MultiSelectTextStyles(
                              textStyle: TextStyle(color: ColorsData.primaryColor, fontFamily: 'Cairo', fontSize: 17.sp),
                              selectedTextStyle:
                                  TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.w800, color: ColorsData.primaryColor, fontSize: 17.sp),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.sp),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Toast.show(
                              "تمت الإضافة بنجاح.",
                              duration: 2,
                              gravity: 2,
                              backgroundColor: const Color.fromARGB(158, 99, 99, 99),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(ColorsData.primaryColor),
                            minimumSize: MaterialStateProperty.all(Size.infinite),
                          ),
                          child: const Text("إضافة سجل الحضور"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
