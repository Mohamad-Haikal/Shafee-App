// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/resources.dart';
import 'package:shafee_app/shared/TestData.dart';
import 'package:shafee_app/teacher/widgets/BottomNavBar.dart';
import 'package:shafee_app/teacher/widgets/CustomAppBarWidget.dart';
import 'package:shafee_app/teacher/widgets/TextViewBoxWidget.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

class AddNewEventScreen extends StatefulWidget {
  const AddNewEventScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNewEventScreen> createState() => _AddNewEventScreenState();
}

class _AddNewEventScreenState extends State<AddNewEventScreen> {
  DateTime? dateTime;
  TextEditingController titleBoxController = TextEditingController();
  TextEditingController locationBoxController = TextEditingController();
  TextEditingController dateBoxController = TextEditingController();
  TextEditingController fromBoxController = TextEditingController();
  TextEditingController toBoxController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    String translateDay(String englishDay) {
      switch (englishDay) {
        case "Sunday":
          return 'الأحد';
        case "Monday":
          return 'الأثنين';
        case "Tuesday":
          return 'الثلاثاء';
        case "Wednesday":
          return 'الأربعاء';
        case "Thursday":
          return 'الخميس';
        case "Friday":
          return 'الجمعة';
        case "Saturday":
          return 'السبت';
        default:
          return englishDay;
      }
    }

    String translateMonth(String englishMonth) {
      switch (englishMonth) {
        case "January":
          return 'يناير';
        case "February":
          return 'فبراير';
        case "March":
          return 'مارس';
        case "April":
          return 'ابريل';
        case "May":
          return 'مايو';
        case "June":
          return 'يونيو';
        case "July":
          return 'يوليو';
        case "August":
          return 'أغسطس';
        case "September":
          return 'سبتمبر';
        case "October":
          return 'أكتوبر';
        case "November":
          return 'نوفمبر';
        case "December":
          return 'ديسمبر';
        default:
          return englishMonth;
      }
    }

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
            child: Text(
              'إضافة حدث جد يد',
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w800, color: const Color.fromARGB(255, 236, 230, 247)),
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
                child: Expanded(
                  flex: 38,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Column(
                          children: [
                            TextViewBox(
                              controller: titleBoxController,
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
                        flex: 6,
                        child: Column(
                          children: [
                            TextViewBox(
                              controller: locationBoxController,
                              hintColor: Colors.grey.shade700,
                              labelColor: null,
                              flex: 1,
                              hintText: "مثال: مركز بشائر النور",
                              labelText: "الموقع",
                              enabled: true,
                              maxLength: 27,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 6,
                          child: Row(
                            children: [
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
                                      dateBoxController.text = DateFormat('yyyy/MM/dd').format(value);
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
                                controller: dateBoxController,
                                hintColor: Colors.grey.shade700,
                                labelColor: null,
                                flex: 5,
                                hintText: "مثال: 2022/01/01",
                                labelText: "تاريخ الحدث",
                                enabled: false,
                              )
                            ],
                          )),
                      Expanded(
                          flex: 6,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
                                    if (value != null) {
                                      toBoxController.text =
                                          '${NumberFormat('00').format(value.hour > 12 ? value.hour - 12 : value.hour)}:${NumberFormat('00').format(value.minute)} ${value.period.name.toUpperCase()}';
                                    } else {
                                      Toast.show(
                                        "الرجاء تحديد وقت صحيح",
                                        duration: 2,
                                        gravity: 2,
                                        backgroundColor: const Color.fromARGB(158, 99, 99, 99),
                                      );
                                    }
                                  });
                                },
                                icon: const Icon(
                                  Icons.access_time,
                                ),
                                iconSize: 22.sp,
                                tooltip: "حدد التاريخ",
                                visualDensity: const VisualDensity(horizontal: -3, vertical: -3),
                                constraints: BoxConstraints(minHeight: 20.sp, minWidth: 20.sp),
                                padding: EdgeInsets.zero,
                              ),
                              TextViewBox(
                                controller: toBoxController,
                                hintColor: Colors.grey.shade700,
                                labelColor: null,
                                flex: 1,
                                hintText: "",
                                labelText: "إلى الساعة",
                                enabled: false,
                                isNumbersOnly: true,
                                maxLength: 3,
                              ),
                              Icon(
                                Icons.chevron_left_outlined,
                                size: 17.sp,
                              ),
                              IconButton(
                                onPressed: () {
                                  showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
                                    if (value != null) {
                                      fromBoxController.text =
                                          '${NumberFormat('00').format(value.hour > 12 ? value.hour - 12 : value.hour)}:${NumberFormat('00').format(value.minute)} ${value.period.name.toUpperCase()}';
                                    } else {
                                      Toast.show(
                                        "الرجاء تحديد وقت صحيح",
                                        duration: 2,
                                        gravity: 2,
                                        backgroundColor: const Color.fromARGB(158, 99, 99, 99),
                                      );
                                    }
                                  });
                                },
                                icon: const Icon(
                                  Icons.access_time,
                                ),
                                iconSize: 22.sp,
                                tooltip: "حدد التاريخ",
                                visualDensity: const VisualDensity(horizontal: -3, vertical: -3),
                                constraints: BoxConstraints(minHeight: 20.sp, minWidth: 20.sp),
                                padding: EdgeInsets.zero,
                              ),
                              TextViewBox(
                                controller: fromBoxController,
                                hintColor: Colors.grey.shade700,
                                labelColor: null,
                                flex: 1,
                                hintText: "",
                                labelText: "من الساعة",
                                enabled: false,
                                isNumbersOnly: true,
                                maxLength: 3,
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.sp),
                            child: ElevatedButton(
                              onPressed: () {
                                eventListCTRl(
                                  eventName: titleBoxController.text,
                                  eventDay: dateTime!.day.toString(),
                                  eventMonth: translateMonth(DateFormat('MMMM').format(dateTime!)),
                                  eventDayName: translateDay(DateFormat('EEEE').format(dateTime!)),
                                  eventTime: '${fromBoxController.text} - ${toBoxController.text}',
                                  eventLocation: locationBoxController.text,
                                  eventImage: 'assets/images/event-img.jpg',
                                );
                                translateMonth(DateFormat('MMMM').format(dateTime!));
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
