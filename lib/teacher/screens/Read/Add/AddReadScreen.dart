// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:rate/rate.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/resources.dart';
import 'package:shafee_app/shared/TestData.dart';
import 'package:shafee_app/teacher/widgets/BottomNavBar.dart';
import 'package:shafee_app/teacher/widgets/CustomAppBarWidget.dart';
import 'package:shafee_app/teacher/widgets/TextViewBoxWidget.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

class AddReadScreen extends StatefulWidget {
  final int readingType;
  final int studentID;
  const AddReadScreen({Key? key, required this.readingType, required this.studentID}) : super(key: key);

  @override
  State<AddReadScreen> createState() => _AddReadScreenState();
}

class _AddReadScreenState extends State<AddReadScreen> {
  int readingType = 2;
  int yesOrNoGroup = 2;
  double starRateValue = 0;
  GroupButtonController readingTypeCtrl = GroupButtonController(selectedIndex: 2);
  late DateTime dateTime;
  TextEditingController textViewBoxController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'تفاصيل التسميع',
                  style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w800, color: const Color.fromARGB(255, 236, 230, 247)),
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
            flex: 9,
            child: Card(
              margin: EdgeInsets.zero,
              color: const Color.fromARGB(255, 236, 230, 247),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.sp), topRight: Radius.circular(20.sp)),
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0.sp),
                child: Column(
                  children: [
                    // خيارات التسميع
                    Visibility(
                      visible: readingType <= 2 && readingType >= 0,
                      child: Expanded(
                        flex: 7,
                        child: GroupButton(
                          buttons: const ['اختبار', 'سرد', 'جديد'],
                          controller: readingTypeCtrl,
                          options: GroupButtonOptions(
                            elevation: 5,
                            groupingType: GroupingType.row,
                            buttonHeight: 35.sp,
                            buttonWidth: 25.w,
                            borderRadius: BorderRadius.all(Radius.circular(16.sp)),
                            direction: Axis.horizontal,
                            selectedColor: ColorsData.primaryColor,
                          ),
                          onSelected: (value, index, isSelected) {
                            setState(
                              () {
                                readingType = index;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    // جديد
                    Visibility(
                      visible: readingType == 2,
                      child: Expanded(
                        flex: 38,
                        child: Column(
                          children: [
                            Expanded(
                                flex: 6,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "هل تم التسميع ؟",
                                        style: TextStyle(fontSize: 15.5.sp, fontWeight: FontWeight.w700),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          const Text("لا"),
                                          Padding(
                                            padding: EdgeInsets.only(right: 30.sp),
                                            child: Radio(
                                              fillColor: MaterialStateProperty.all(Colors.grey.shade700),
                                              value: 1,
                                              groupValue: yesOrNoGroup,
                                              onChanged: (value) {
                                                setState(() {
                                                  yesOrNoGroup = value.hashCode;
                                                });
                                              },
                                            ),
                                          ),
                                          const Text("نعم"),
                                          Radio(
                                              fillColor: MaterialStateProperty.all(Colors.grey.shade700),
                                              value: 2,
                                              groupValue: yesOrNoGroup,
                                              onChanged: (value) {
                                                setState(() {
                                                  yesOrNoGroup = value.hashCode;
                                                });
                                              }),
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                            Expanded(
                                flex: 6,
                                child: Row(
                                  children: [
                                    Visibility(
                                      visible: yesOrNoGroup == 2,
                                      child: TextViewBox(
                                        hintColor: Colors.grey.shade700,
                                        labelColor: null,
                                        flex: 2,
                                        hintText: "3",
                                        labelText: "عدد النقاط",
                                        enabled: false,
                                        isNumbersOnly: true,
                                        maxLength: 2,
                                        backgroundColor: const Color.fromARGB(255, 223, 223, 223),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2020),
                                                lastDate: DateTime(DateTime.now().year + 1))
                                            .then((value) {
                                          if (value != null) {
                                            dateTime = value;
                                            textViewBoxController.text = DateFormat('yyyy/MM/dd').format(value);
                                          } else {
                                            Toast.show(
                                              "الرجاء تحديد تاريخ",
                                              duration: 2,
                                              gravity: 2,
                                              backgroundColor: const Color.fromARGB(158, 99, 99, 99),
                                            );
                                          }
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.date_range_outlined,
                                      ),
                                      iconSize: 22.sp,
                                      tooltip: "حدد التاريخ",
                                      visualDensity: const VisualDensity(horizontal: -3, vertical: -3),
                                      constraints: BoxConstraints(minHeight: 20.sp, minWidth: 20.sp),
                                      padding: EdgeInsets.zero,
                                    ),
                                    TextViewBox(
                                      controller: textViewBoxController,
                                      hintColor: Colors.grey.shade700,
                                      labelColor: null,
                                      flex: 5,
                                      hintText: "مثال: 2022/01/01",
                                      labelText: "تاريخ التسميع",
                                      enabled: false,
                                    )
                                  ],
                                )),
                            Visibility(
                              visible: yesOrNoGroup == 2,
                              child: Expanded(
                                flex: 26,
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 6,
                                        child: Row(
                                          children: [
                                            TextViewBox(
                                              hintColor: Colors.grey.shade700,
                                              labelColor: null,
                                              flex: 1,
                                              hintText: "2",
                                              labelText: "الأخطاء",
                                              enabled: true,
                                              isNumbersOnly: true,
                                              maxLength: 2,
                                            ),
                                            TextViewBox(
                                              hintColor: Colors.grey.shade700,
                                              labelColor: null,
                                              flex: 1,
                                              hintText: "40",
                                              labelText: "إلى صفحة",
                                              enabled: true,
                                              isNumbersOnly: true,
                                              maxLength: 3,
                                            ),
                                            Icon(
                                              Icons.chevron_left_outlined,
                                              size: 17.sp,
                                            ),
                                            TextViewBox(
                                              hintColor: Colors.grey.shade700,
                                              labelColor: null,
                                              flex: 1,
                                              hintText: "20",
                                              labelText: "من صفحة",
                                              enabled: true,
                                              isNumbersOnly: true,
                                              maxLength: 3,
                                            )
                                          ],
                                        )),
                                    Expanded(
                                      flex: 6,
                                      child: Column(
                                        children: [
                                          TextViewBox(
                                            hintColor: Colors.grey.shade700,
                                            labelColor: null,
                                            flex: 1,
                                            hintText: "مثال: تسميع الجزء الثاني كامل",
                                            labelText: "العنوان",
                                            enabled: true,
                                            maxLength: 27,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 14,
                                      child: Column(
                                        children: [
                                          TextViewBox(
                                            hintColor: Colors.grey.shade700,
                                            labelColor: null,
                                            flex: 1,
                                            hintText: "لا يوجد ملاحظات",
                                            labelText: "الملاحظات",
                                            enabled: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // سرد
                    Visibility(
                      visible: readingType == 1,
                      child: Expanded(
                        flex: 38,
                        child: Column(
                          children: [
                            Expanded(
                                flex: 6,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "هل تم السرد ؟",
                                        style: TextStyle(fontSize: 15.5.sp, fontWeight: FontWeight.w700),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          const Text("لا"),
                                          Padding(
                                            padding: EdgeInsets.only(right: 30.sp),
                                            child: Radio(
                                              fillColor: MaterialStateProperty.all(Colors.grey.shade700),
                                              value: 1,
                                              groupValue: yesOrNoGroup,
                                              onChanged: (value) {
                                                setState(() {
                                                  yesOrNoGroup = value.hashCode;
                                                });
                                              },
                                            ),
                                          ),
                                          const Text("نعم"),
                                          Radio(
                                              fillColor: MaterialStateProperty.all(Colors.grey.shade700),
                                              value: 2,
                                              groupValue: yesOrNoGroup,
                                              onChanged: (value) {
                                                setState(() {
                                                  yesOrNoGroup = value.hashCode;
                                                });
                                              }),
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                            Expanded(
                                flex: 6,
                                child: Row(
                                  children: [
                                    // TextViewBox(
                                    //   hintColor: Colors.grey.shade700,
                                    //   labelColor: null,
                                    //   flex: 2,
                                    //   hintText: "3",
                                    //   labelText: "عدد النقاط",
                                    //   enabled: false,
                                    //   isNumbersOnly: true,
                                    //   maxLength: 2,
                                    //   backgroundColor:
                                    //       const Color.fromARGB(
                                    //           255, 223, 223, 223),
                                    // ),
                                    Visibility(
                                      visible: yesOrNoGroup == 2,
                                      child: Expanded(
                                        flex: 3,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "التقييم",
                                              style: TextStyle(
                                                  fontSize: 15.sp, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 114, 114, 114)),
                                            ),
                                            Rate(
                                              color: const Color.fromARGB(255, 98, 71, 170),
                                              iconSize: 20.sp,
                                              onChange: (value) {},
                                              initialValue: 4,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        showDatePicker(
                                                context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime(2030))
                                            .then((value) {
                                          if (value != null) {
                                            dateTime = value;
                                            textViewBoxController.text = DateFormat('yyyy/MM/dd').format(value);
                                          } else {
                                            Toast.show(
                                              "الرجاء تحديد تاريخ",
                                              duration: 2,
                                              gravity: 2,
                                              backgroundColor: const Color.fromARGB(158, 99, 99, 99),
                                            );
                                          }
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.date_range_outlined,
                                      ),
                                      iconSize: 22.sp,
                                      tooltip: "حدد التاريخ",
                                      visualDensity: const VisualDensity(horizontal: -3, vertical: -3),
                                      constraints: BoxConstraints(minHeight: 20.sp, minWidth: 20.sp),
                                      padding: EdgeInsets.zero,
                                    ),
                                    TextViewBox(
                                      controller: textViewBoxController,
                                      hintColor: Colors.grey.shade700,
                                      labelColor: null,
                                      flex: 5,
                                      hintText: "مثال: 2022/01/01",
                                      labelText: "تاريخ السرد",
                                      enabled: false,
                                    )
                                  ],
                                )),
                            Visibility(
                              visible: yesOrNoGroup == 2,
                              child: Expanded(
                                flex: 26,
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 6,
                                        child: Row(
                                          children: [
                                            // TextViewBox(
                                            //   hintColor: Colors.grey.shade700,
                                            //   labelColor: null,
                                            //   flex: 1,
                                            //   hintText: "2",
                                            //   labelText: "الأخطاء",
                                            //   enabled: true,
                                            //   isNumbersOnly: true,
                                            //   maxLength: 2,
                                            // ),
                                            TextViewBox(
                                              hintColor: Colors.grey.shade700,
                                              labelColor: null,
                                              flex: 4,
                                              hintText: "3",
                                              labelText: "عدد النقاط",
                                              enabled: false,
                                              isNumbersOnly: true,
                                              maxLength: 2,
                                              backgroundColor: const Color.fromARGB(255, 223, 223, 223),
                                            ),
                                            TextViewBox(
                                              hintColor: Colors.grey.shade700,
                                              labelColor: null,
                                              flex: 4,
                                              hintText: "40",
                                              labelText: "إلى الجزء",
                                              enabled: true,
                                              isNumbersOnly: true,
                                              maxLength: 2,
                                            ),
                                            Icon(
                                              Icons.chevron_left_outlined,
                                              size: 17.sp,
                                            ),
                                            TextViewBox(
                                              hintColor: Colors.grey.shade700,
                                              labelColor: null,
                                              flex: 4,
                                              hintText: "20",
                                              labelText: "من الجزء",
                                              enabled: true,
                                              isNumbersOnly: true,
                                              maxLength: 2,
                                            )
                                          ],
                                        )),
                                    Expanded(
                                      flex: 6,
                                      child: Column(
                                        children: [
                                          TextViewBox(
                                            hintColor: Colors.grey.shade700,
                                            labelColor: null,
                                            flex: 1,
                                            hintText: "مثال: تسميع الجزء الثاني كامل",
                                            labelText: "العنوان",
                                            enabled: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 14,
                                      child: Column(
                                        children: [
                                          TextViewBox(
                                            hintColor: Colors.grey.shade700,
                                            labelColor: null,
                                            flex: 1,
                                            hintText: "لا يوجد ملاحظات",
                                            labelText: "الملاحظات",
                                            enabled: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // اختبار
                    Visibility(
                      visible: readingType == 0,
                      child: Expanded(
                        flex: 38,
                        child: Column(
                          children: [
                            Expanded(
                                flex: 6,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "هل تم الاختبار ؟",
                                        style: TextStyle(fontSize: 15.5.sp, fontWeight: FontWeight.w700),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          const Text("لا"),
                                          Padding(
                                            padding: EdgeInsets.only(right: 30.sp),
                                            child: Radio(
                                              fillColor: MaterialStateProperty.all(Colors.grey.shade700),
                                              value: 1,
                                              groupValue: yesOrNoGroup,
                                              onChanged: (value) {
                                                setState(() {
                                                  yesOrNoGroup = value.hashCode;
                                                });
                                              },
                                            ),
                                          ),
                                          const Text("نعم"),
                                          Radio(
                                              fillColor: MaterialStateProperty.all(Colors.grey.shade700),
                                              value: 2,
                                              groupValue: yesOrNoGroup,
                                              onChanged: (value) {
                                                setState(() {
                                                  yesOrNoGroup = value.hashCode;
                                                });
                                              }),
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                            Expanded(
                                flex: 6,
                                child: Row(
                                  children: [
                                    Visibility(
                                      visible: yesOrNoGroup == 2,
                                      child: TextViewBox(
                                        hintColor: Colors.grey.shade700,
                                        labelColor: null,
                                        flex: 2,
                                        hintText: "15",
                                        labelText: "عدد النقاط",
                                        enabled: true,
                                        isNumbersOnly: true,
                                        maxLength: 2,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        showDatePicker(
                                                context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime(2030))
                                            .then((value) {
                                          if (value != null) {
                                            dateTime = value;
                                            textViewBoxController.text = DateFormat('yyyy/MM/dd').format(value);
                                          } else {
                                            Toast.show(
                                              "الرجاء تحديد تاريخ",
                                              duration: 2,
                                              gravity: 2,
                                              backgroundColor: const Color.fromARGB(158, 99, 99, 99),
                                            );
                                          }
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.date_range_outlined,
                                      ),
                                      iconSize: 22.sp,
                                      tooltip: "حدد التاريخ",
                                      visualDensity: const VisualDensity(horizontal: -3, vertical: -3),
                                      constraints: BoxConstraints(minHeight: 20.sp, minWidth: 20.sp),
                                      padding: EdgeInsets.zero,
                                    ),
                                    TextViewBox(
                                      controller: textViewBoxController,
                                      hintColor: Colors.grey.shade700,
                                      labelColor: null,
                                      flex: 5,
                                      hintText: "مثال: 2022/01/01",
                                      labelText: "تاريخ الإختبار",
                                      enabled: false,
                                    )
                                  ],
                                )),
                            Visibility(
                              visible: yesOrNoGroup == 2,
                              child: Expanded(
                                flex: 26,
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 6,
                                        child: Row(
                                          children: [
                                            // TextViewBox(
                                            //   hintColor:
                                            //       Colors.grey.shade700,
                                            //   labelColor: null,
                                            //   flex: 1,
                                            //   hintText: "2",
                                            //   labelText: "الأخطاء",
                                            //   enabled: true,
                                            //   isNumbersOnly: true,
                                            //   maxLength: 2,
                                            // ),
                                            TextViewBox(
                                              hintColor: Colors.grey.shade700,
                                              labelColor: null,
                                              flex: 1,
                                              hintText: "40",
                                              labelText: "إلى صفحة",
                                              enabled: true,
                                              isNumbersOnly: true,
                                              maxLength: 3,
                                            ),
                                            Icon(
                                              Icons.chevron_left_outlined,
                                              size: 17.sp,
                                            ),
                                            TextViewBox(
                                              hintColor: Colors.grey.shade700,
                                              labelColor: null,
                                              flex: 1,
                                              hintText: "20",
                                              labelText: "من صفحة ",
                                              enabled: true,
                                              isNumbersOnly: true,
                                              maxLength: 3,
                                            )
                                          ],
                                        )),
                                    Expanded(
                                      flex: 6,
                                      child: Column(
                                        children: [
                                          TextViewBox(
                                            hintColor: Colors.grey.shade700,
                                            labelColor: null,
                                            flex: 1,
                                            hintText: "مثال: تسميع الجزء الثاني كامل",
                                            labelText: "العنوان",
                                            enabled: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 14,
                                      child: Column(
                                        children: [
                                          TextViewBox(
                                            hintColor: Colors.grey.shade700,
                                            labelColor: null,
                                            flex: 1,
                                            hintText: "لا يوجد ملاحظات",
                                            labelText: "الملاحظات",
                                            enabled: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // زر اضافة جديد
                    Visibility(
                      visible: readingType <= 2 && readingType >= 0,
                      child: Expanded(
                          flex: 4,
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
                              child: const Text("إضافة جديد"),
                            ),
                          )),
                    ),
                    // خطأ غير معروف
                    Visibility(
                      visible: readingType > 2,
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text("خطأ غير معروف"),
                                Text("حاول الرجوع واعادة فتح هذه الصفحة"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
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
