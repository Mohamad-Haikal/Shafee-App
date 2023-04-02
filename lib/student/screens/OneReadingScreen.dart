// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/resources.dart';
import 'package:shafee_app/services/auth.dart';
import 'package:shafee_app/student/widgets/BottomNavBar.dart';
import 'package:shafee_app/student/widgets/CustomAppBarWidget.dart';
import 'package:shafee_app/student/widgets/TextViewBoxWidget.dart';

class OneReadingScreen extends StatefulWidget {
  final String recordId;
  const OneReadingScreen({Key? key, required this.recordId}) : super(key: key);

  @override
  State<OneReadingScreen> createState() => _OneReadingScreenState();
}

class _OneReadingScreenState extends State<OneReadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          FutureBuilder(
              future: FirebaseFirestore.instance.collection('users').doc('${AuthCtrl.currentUser()?.uid}').get(),
              builder: (context, doc) {
                if (doc.hasData && !doc.hasError) {
                  var records = (((doc.data as DocumentSnapshot).data() as Map)['records'] as List);
                  var data = {};
                  for (var record in records) {
                    if ((record as Map)['id'] == widget.recordId) {
                      data = record;
                    }
                  }
                  int readingType = int.parse(data['type']);
                  return Expanded(
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
                                      readingType == 2
                                          ? Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.all(13.sp),
                                                child: ElevatedButton(
                                                  onPressed: null,
                                                  style: ButtonStyle(
                                                    shape: MaterialStateProperty.all(
                                                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0.sp))),
                                                    elevation: MaterialStateProperty.all(14),
                                                    backgroundColor: MaterialStateProperty.all(Colors.white),
                                                    foregroundColor: MaterialStateProperty.all(Colors.black87),
                                                    minimumSize: MaterialStateProperty.all(Size.infinite),
                                                  ),
                                                  child: Text(
                                                    "إختبار",
                                                    style: TextStyle(
                                                        letterSpacing: 0, color: Colors.grey[700], fontSize: 16.sp, fontWeight: FontWeight.w900),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.all(13.sp),
                                                child: ElevatedButton(
                                                  onPressed: null,
                                                  style: ButtonStyle(
                                                    shape: MaterialStateProperty.all(
                                                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0.sp))),
                                                    elevation: MaterialStateProperty.all(7),
                                                    backgroundColor: MaterialStateProperty.all(Colors.grey.shade400),
                                                    foregroundColor: MaterialStateProperty.all(Colors.black87),
                                                    minimumSize: MaterialStateProperty.all(Size.infinite),
                                                  ),
                                                  child: Text(
                                                    "إختبار",
                                                    style: TextStyle(
                                                        letterSpacing: 0, color: Colors.grey[700], fontSize: 16.sp, fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                            ),
                                      readingType == 1
                                          ? Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.all(13.sp),
                                                child: ElevatedButton(
                                                  onPressed: null,
                                                  style: ButtonStyle(
                                                    shape: MaterialStateProperty.all(
                                                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0.sp))),
                                                    elevation: MaterialStateProperty.all(14),
                                                    backgroundColor: MaterialStateProperty.all(Colors.white),
                                                    foregroundColor: MaterialStateProperty.all(Colors.black87),
                                                    minimumSize: MaterialStateProperty.all(Size.infinite),
                                                  ),
                                                  child: Text(
                                                    "سرد",
                                                    style: TextStyle(
                                                        letterSpacing: 0, color: Colors.grey[700], fontSize: 16.sp, fontWeight: FontWeight.w900),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.all(13.sp),
                                                child: ElevatedButton(
                                                  onPressed: null,
                                                  style: ButtonStyle(
                                                    shape: MaterialStateProperty.all(
                                                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0.sp))),
                                                    elevation: MaterialStateProperty.all(7),
                                                    backgroundColor: MaterialStateProperty.all(Colors.grey.shade400),
                                                    foregroundColor: MaterialStateProperty.all(Colors.black87),
                                                    minimumSize: MaterialStateProperty.all(Size.infinite),
                                                  ),
                                                  child: Text(
                                                    "سرد",
                                                    style: TextStyle(
                                                        letterSpacing: 0, color: Colors.grey[700], fontSize: 16.sp, fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                            ),
                                      readingType == 0
                                          ? Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.all(13.sp),
                                                child: ElevatedButton(
                                                  onPressed: null,
                                                  style: ButtonStyle(
                                                    shape: MaterialStateProperty.all(
                                                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0.sp))),
                                                    elevation: MaterialStateProperty.all(14),
                                                    backgroundColor: MaterialStateProperty.all(Colors.white),
                                                    foregroundColor: MaterialStateProperty.all(Colors.black87),
                                                    minimumSize: MaterialStateProperty.all(Size.infinite),
                                                  ),
                                                  child: Text(
                                                    "جد يد",
                                                    style: TextStyle(
                                                        letterSpacing: 0, color: Colors.grey[700], fontSize: 16.sp, fontWeight: FontWeight.w900),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.all(13.sp),
                                                child: ElevatedButton(
                                                  onPressed: null,
                                                  style: ButtonStyle(
                                                    shape: MaterialStateProperty.all(
                                                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0.sp))),
                                                    elevation: MaterialStateProperty.all(7),
                                                    backgroundColor: MaterialStateProperty.all(Colors.grey.shade400),
                                                    foregroundColor: MaterialStateProperty.all(Colors.black87),
                                                    minimumSize: MaterialStateProperty.all(Size.infinite),
                                                  ),
                                                  child: Text(
                                                    "جد يد",
                                                    style: TextStyle(
                                                        letterSpacing: 0, color: Colors.grey[700], fontSize: 16.sp, fontWeight: FontWeight.w600),
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
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            const Text("لا"),
                                            Padding(
                                              padding: EdgeInsets.only(right: 30.sp),
                                              child: Radio(
                                                fillColor: MaterialStateProperty.all(Colors.grey.shade700),
                                                value: (data['isDone'] as bool) == false ? 2 : 1,
                                                groupValue: 2,
                                                onChanged: null,
                                              ),
                                            ),
                                            const Text("نعم"),
                                            Radio(
                                                fillColor: MaterialStateProperty.all(Colors.grey.shade700),
                                                value: (data['isDone'] as bool) == true ? 2 : 1,
                                                groupValue: 2,
                                                onChanged: null),
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
                                        hintText: data['errors'].toString(),
                                        labelText: "الأخطاء",
                                      ),
                                      TextViewBox(
                                        hintColor: Colors.grey.shade700,
                                        labelColor: null,
                                        flex: 1,
                                        hintText: (data['range'] as Map)['to'].toString(),
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
                                        hintText: (data['range'] as Map)['from'].toString(),
                                        labelText: "من الصفحة",
                                      )
                                    ],
                                  )),
                              Expanded(
                                  flex: 6,
                                  child: Row(
                                    children: [
                                      TextViewBox(
                                        hintColor:
                                            int.parse(data['points']) >= 0 ? Color.fromARGB(255, 90, 189, 103) : Color.fromARGB(255, 189, 90, 90),
                                        labelColor: null,
                                        flex: 2,
                                        hintText: data['points'].toString(),
                                        labelText: "عدد النقاط",
                                      ),
                                      TextViewBox(
                                        hintColor: Colors.grey.shade700,
                                        labelColor: null,
                                        flex: 3,
                                        hintText: DateFormat("y/MM/dd").format((data['date'] as Timestamp).toDate()).toString(),
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
                                        hintText: data['title'].toString(),
                                        labelText: "العنوان"),
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
                                        hintText: data['notes'].toString(),
                                        labelText: "الملاحظات"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return Expanded(
                    flex: 9,
                    child: Stack(
                      children: [
                        Card(
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
                                                  shape:
                                                      MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0.sp))),
                                                  elevation: MaterialStateProperty.all(7),
                                                  backgroundColor: MaterialStateProperty.all(Colors.grey.shade400),
                                                  foregroundColor: MaterialStateProperty.all(Colors.black87),
                                                  minimumSize: MaterialStateProperty.all(Size.infinite),
                                                ),
                                                child: Text(
                                                  "إختبار",
                                                  style: TextStyle(
                                                      letterSpacing: 0, color: Colors.grey[700], fontSize: 16.sp, fontWeight: FontWeight.w600),
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
                                                  shape:
                                                      MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0.sp))),
                                                  elevation: MaterialStateProperty.all(7),
                                                  backgroundColor: MaterialStateProperty.all(Colors.grey.shade400),
                                                  foregroundColor: MaterialStateProperty.all(Colors.black87),
                                                  minimumSize: MaterialStateProperty.all(Size.infinite),
                                                ),
                                                child: Text(
                                                  "سرد",
                                                  style: TextStyle(
                                                      letterSpacing: 0, color: Colors.grey[700], fontSize: 16.sp, fontWeight: FontWeight.w600),
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
                                                  shape:
                                                      MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0.sp))),
                                                  elevation: MaterialStateProperty.all(7),
                                                  backgroundColor: MaterialStateProperty.all(Colors.grey.shade400),
                                                  foregroundColor: MaterialStateProperty.all(Colors.black87),
                                                  minimumSize: MaterialStateProperty.all(Size.infinite),
                                                ),
                                                child: Text(
                                                  "جد يد",
                                                  style: TextStyle(
                                                      letterSpacing: 0, color: Colors.grey[700], fontSize: 16.sp, fontWeight: FontWeight.w600),
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
                                                    groupValue: 3,
                                                    onChanged: null,
                                                  ),
                                                ),
                                                const Text("نعم"),
                                                Radio(
                                                    fillColor: MaterialStateProperty.all(Colors.grey.shade700),
                                                    value: 1,
                                                    groupValue: 4,
                                                    onChanged: null),
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
                                            hintText: "",
                                            labelText: "الأخطاء",
                                          ),
                                          TextViewBox(
                                            hintColor: Colors.grey.shade700,
                                            labelColor: null,
                                            flex: 1,
                                            hintText: "",
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
                                            hintText: "",
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
                                            hintText: "",
                                            labelText: "عدد النقاط",
                                          ),
                                          TextViewBox(
                                            hintColor: Colors.grey.shade700,
                                            labelColor: null,
                                            flex: 3,
                                            hintText: "",
                                            labelText: "تاريخ التسميع",
                                          ),
                                        ],
                                      )),
                                  Expanded(
                                    flex: 6,
                                    child: Column(
                                      children: [
                                        TextViewBox(hintColor: Colors.grey.shade700, labelColor: null, flex: 1, hintText: "", labelText: "العنوان"),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 14,
                                    child: Column(
                                      children: [
                                        TextViewBox(hintColor: Colors.grey.shade700, labelColor: null, flex: 1, hintText: "", labelText: "الملاحظات"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: 0.5,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.sp),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 5,
                          ),
                        )
                      ],
                    ));
              }),
        ],
      ),
    );
  }
}
