// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/resources.dart';
import 'package:shafee_app/student/widgets/BottomNavBar.dart';
import 'package:shafee_app/student/widgets/CustomAppBarWidget.dart';
import 'package:shafee_app/student/widgets/TextViewBoxWidget.dart';

class OneReadingScreen extends StatefulWidget {
  final int readingType;
  const OneReadingScreen({Key? key, required this.readingType}) : super(key: key);

  @override
  State<OneReadingScreen> createState() => _OneReadingScreenState();
}

class _OneReadingScreenState extends State<OneReadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
extendBody: true,
          backgroundColor: ColorsData.themeColor[2],      appBar: CustomAppBarWidget(
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
                  'تاريخ التسميع : ${DateFormat('yyyy/MM/dd').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day))}',
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 236, 230, 247)),
                ),
                Text(
                  'رقم التسميع: 0032324985',
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color.fromARGB(255, 236, 230, 247)),
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
                child: Form(
                  child: Column(
                    children: [
                      Expanded(
                          flex: 7,
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(13.sp),
                                  child: ElevatedButton(
                                    onPressed: null,
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0.sp))),
                                        elevation: MaterialStateProperty.all(7),
                                        backgroundColor: MaterialStateProperty.all(widget.readingType == 2 ? Colors.white : Colors.grey.shade400),
                                        foregroundColor: MaterialStateProperty.all(Colors.black87),
                                        minimumSize: MaterialStateProperty.all(Size.infinite),
                                        side: widget.readingType == 2
                                            ? MaterialStateProperty.all(
                                                BorderSide(width: 2, color: Colors.grey.shade700),
                                              )
                                            : null),
                                    child: Text(
                                      "إختبار",
                                      style: TextStyle(
                                          letterSpacing: 0,
                                          color: Colors.grey[700],
                                          fontSize: 16.sp,
                                          fontWeight: widget.readingType == 2 ? FontWeight.w900 : FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(13.sp),
                                  child: ElevatedButton(
                                    onPressed: null,
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0.sp))),
                                        elevation: MaterialStateProperty.all(7),
                                        backgroundColor: MaterialStateProperty.all(widget.readingType == 1 ? Colors.white : Colors.grey.shade400),
                                        foregroundColor: MaterialStateProperty.all(Colors.black87),
                                        minimumSize: MaterialStateProperty.all(Size.infinite),
                                        side: widget.readingType == 1
                                            ? MaterialStateProperty.all(
                                                BorderSide(width: 2, color: Colors.grey.shade700),
                                              )
                                            : null),
                                    child: Text(
                                      "سرد",
                                      style: TextStyle(
                                          letterSpacing: 0,
                                          color: Colors.grey[700],
                                          fontSize: 16.sp,
                                          fontWeight: widget.readingType == 1 ? FontWeight.w900 : FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(13.sp),
                                  child: ElevatedButton(
                                    onPressed: null,
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0.sp))),
                                        elevation: MaterialStateProperty.all(7),
                                        backgroundColor: MaterialStateProperty.all(widget.readingType == 0 ? Colors.white : Colors.grey.shade400),
                                        foregroundColor: MaterialStateProperty.all(Colors.black87),
                                        minimumSize: MaterialStateProperty.all(Size.infinite),
                                        side: widget.readingType == 0
                                            ? MaterialStateProperty.all(
                                                BorderSide(width: 2, color: Colors.grey.shade700),
                                              )
                                            : null),
                                    child: Text(
                                      "جد يد",
                                      style: TextStyle(
                                          letterSpacing: 0,
                                          color: Colors.grey[700],
                                          fontSize: 16.sp,
                                          fontWeight: widget.readingType == 0 ? FontWeight.w900 : FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 6,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "هل تم التسميع ؟",
                                  style: TextStyle(fontSize: 15.5.sp, fontWeight: FontWeight.w700),
                                )
                                ,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text("لا"),
                                    Padding(
                                      padding: EdgeInsets.only(right: 30.sp),
                                      child: Radio(
                                        fillColor: MaterialStateProperty.all(Colors.grey.shade700),
                                        value: 1,
                                        groupValue: 2,
                                        onChanged: null,
                                      ),
                                    ),
                                    const Text("نعم"),
                                    Radio(fillColor: MaterialStateProperty.all(Colors.grey.shade700), value: 2, groupValue: 2, onChanged: null),
                                  ],
                                )
                              ],
                            ),
                          )),
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
                              ),
                              TextViewBox(
                                hintColor: Colors.grey.shade700,
                                labelColor: null,
                                flex: 1,
                                hintText: "40",
                                labelText: "إلى",
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
                                labelText: "من الصفحة",
                              )
                            ],
                          )),
                      Expanded(
                          flex: 6,
                          child: Row(
                            children: [
                              TextViewBox(
                                hintColor: Colors.grey.shade700,
                                labelColor: null,
                                flex: 2,
                                hintText: "15",
                                labelText: "عدد النقاط",
                              ),
                              TextViewBox(
                                hintColor: Colors.grey.shade700,
                                labelColor: null,
                                flex: 3,
                                hintText: "2022/10/09",
                                labelText: "تاريخ التسميع",
                              ),
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
                                labelText: "العنوان"),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 14,
                        child: Column(
                          children: [
                            TextViewBox(
                                hintColor: Colors.grey.shade700, labelColor: null, flex: 1, hintText: "لا يوجد ملاحظات", labelText: "الملاحظات"),
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
