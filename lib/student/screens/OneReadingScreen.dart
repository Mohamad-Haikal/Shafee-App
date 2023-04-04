// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 56),
            alignment: Alignment.topCenter,
            height: 35.h,
            child: FutureBuilder(
              future: FirebaseFirestore.instance.collection('users').doc('${AuthCtrl.currentUser()?.uid}').get(),
              builder: (context, doc) {
                if (doc.hasData && !doc.hasError) {
                  List records = (((doc.data as DocumentSnapshot).data() as Map)['records'] as List);
                  var data = {};

                  for (var record in records) {
                    if ((record as Map)['id'] == widget.recordId) {
                      data = record;
                    }
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'تفاصيل التسميع',
                        style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w800, color: const Color.fromARGB(255, 236, 230, 247)),
                      ),
                      Text(
                        'رقم التسميع: ${data['id']}',
                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color.fromARGB(255, 236, 230, 247)),
                      ),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          SizedBox.expand(
            child: DraggableScrollableSheet(
              initialChildSize: 0.8,
              maxChildSize: 1,
              minChildSize: 0.8,
              snap: true,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.sp), topRight: Radius.circular(20.sp)),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.sp), topRight: Radius.circular(20.sp)),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.fromLTRB(10.sp, 10.sp, 10.sp, 0),
                      child: FutureBuilder(
                        future: FirebaseFirestore.instance.collection('users').doc('${AuthCtrl.currentUser()?.uid}').get(),
                        builder: (context, doc) {
                          if (doc.hasData && !doc.hasError) {
                            List records = (((doc.data as DocumentSnapshot).data() as Map)['records'] as List);
                            var data = {};

                            for (var record in records) {
                              if ((record as Map)['id'] == widget.recordId) {
                                data = record;
                              }
                            }
                            int readingType = int.parse('${data['type']}');
                            return StaggeredGrid.count(
                              axisDirection: AxisDirection.down,
                              crossAxisSpacing: 7.sp,
                              mainAxisSpacing: 7.sp,
                              crossAxisCount: 12,
                              children: widgets(context: context, readingType: readingType, data: data),
                            );
                          }

                          return StaggeredGrid.count(
                            axisDirection: AxisDirection.down,
                            crossAxisSpacing: 7.sp,
                            mainAxisSpacing: 7.sp,
                            crossAxisCount: 12,
                            children: widgets(context: context, readingType: 0, data: {
                              'isDone': false,
                              'errors': '0',
                              'range': {'to': '000', 'from': '000'},
                              'points': '0',
                              'date': Timestamp.now(),
                              'title': '',
                              'notes': ''
                            }),
                          );
                        },
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
  }
}

List<Widget> widgets({required BuildContext context, required int readingType, required data}) {
  return [
    StaggeredGridTile.count(
      crossAxisCellCount: 4,
      mainAxisCellCount: 3,
      child: readingType == 2
          ? Padding(
              padding: EdgeInsets.all(13.sp),
              child: ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0.sp))),
                  elevation: MaterialStateProperty.all(14),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black87),
                  minimumSize: MaterialStateProperty.all(Size.infinite),
                ),
                child: Text(
                  "إختبار",
                  style: TextStyle(letterSpacing: 0, color: Colors.grey[700], fontSize: 16.sp, fontWeight: FontWeight.w900),
                ),
              ),
            )
          : Padding(
              padding: EdgeInsets.all(13.sp),
              child: ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0.sp))),
                  elevation: MaterialStateProperty.all(7),
                  backgroundColor: MaterialStateProperty.all(Colors.grey.shade400),
                  foregroundColor: MaterialStateProperty.all(Colors.black87),
                  minimumSize: MaterialStateProperty.all(Size.infinite),
                ),
                child: Text(
                  "إختبار",
                  style: TextStyle(letterSpacing: 0, color: Colors.grey[700], fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 4,
      mainAxisCellCount: 3,
      child: readingType == 1
          ? Padding(
              padding: EdgeInsets.all(13.sp),
              child: ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0.sp))),
                  elevation: MaterialStateProperty.all(14),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black87),
                  minimumSize: MaterialStateProperty.all(Size.infinite),
                ),
                child: Text(
                  "سرد",
                  style: TextStyle(letterSpacing: 0, color: Colors.grey[700], fontSize: 16.sp, fontWeight: FontWeight.w900),
                ),
              ),
            )
          : Padding(
              padding: EdgeInsets.all(13.sp),
              child: ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0.sp))),
                  elevation: MaterialStateProperty.all(7),
                  backgroundColor: MaterialStateProperty.all(Colors.grey.shade400),
                  foregroundColor: MaterialStateProperty.all(Colors.black87),
                  minimumSize: MaterialStateProperty.all(Size.infinite),
                ),
                child: Text(
                  "سرد",
                  style: TextStyle(letterSpacing: 0, color: Colors.grey[700], fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 4,
      mainAxisCellCount: 3,
      child: readingType == 0
          ? Padding(
              padding: EdgeInsets.all(13.sp),
              child: ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0.sp))),
                  elevation: MaterialStateProperty.all(14),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black87),
                  minimumSize: MaterialStateProperty.all(Size.infinite),
                ),
                child: Text(
                  "جد يد",
                  style: TextStyle(letterSpacing: 0, color: Colors.grey[700], fontSize: 16.sp, fontWeight: FontWeight.w900),
                ),
              ),
            )
          : Padding(
              padding: EdgeInsets.all(13.sp),
              child: ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0.sp))),
                  elevation: MaterialStateProperty.all(7),
                  backgroundColor: MaterialStateProperty.all(Colors.grey.shade400),
                  foregroundColor: MaterialStateProperty.all(Colors.black87),
                  minimumSize: MaterialStateProperty.all(Size.infinite),
                ),
                child: Text(
                  "جد يد",
                  style: TextStyle(letterSpacing: 0, color: Colors.grey[700], fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 12,
      mainAxisCellCount: 2.8,
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
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 5,
      mainAxisCellCount: 2.8,
      child: Center(
        child: TextViewBox(
          hintColor: Colors.grey.shade700,
          labelColor: null,
          flex: 1,
          hintText: data['errors'].toString(),
          labelText: "الأخطاء",
        ),
      ),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 3,
      mainAxisCellCount: 2.8,
      child: Center(
        child: TextViewBox(
          hintColor: Colors.grey.shade700,
          labelColor: null,
          flex: 1,
          hintText: (data['range'] as Map)['to'].toString(),
          labelText: "إلى الصفحة",
        ),
      ),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 2.8,
      child: Icon(
        Icons.chevron_left_outlined,
        size: 17.sp,
      ),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 3,
      mainAxisCellCount: 2.8,
      child: Center(
        child: TextViewBox(
          hintColor: Colors.grey.shade700,
          labelColor: null,
          flex: 1,
          hintText: (data['range'] as Map)['from'].toString(),
          labelText: "من الصفحة",
        ),
      ),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 6,
      mainAxisCellCount: 2.8,
      child: Center(
        child: TextViewBox(
          hintColor: int.parse(data['points']) >= 0 ? Color.fromARGB(255, 90, 189, 103) : Color.fromARGB(255, 189, 90, 90),
          labelColor: null,
          flex: 2,
          hintText: data['points'].toString(),
          labelText: "عدد النقاط",
        ),
      ),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 6,
      mainAxisCellCount: 2.8,
      child: Center(
        child: TextViewBox(
          hintColor: Colors.grey.shade700,
          labelColor: null,
          flex: 3,
          hintText: DateFormat("y/MM/dd").format((data['date'] as Timestamp).toDate()).toString(),
          labelText: "تاريخ التسميع",
        ),
      ),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 12,
      mainAxisCellCount: 3,
      child: Center(
          child: TextViewBox(hintColor: Colors.grey.shade700, labelColor: null, flex: 1, hintText: data['title'].toString(), labelText: "العنوان")),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 12,
      mainAxisCellCount: 6,
      child: Center(
          child: TextViewBox(hintColor: Colors.grey.shade700, labelColor: null, flex: 1, hintText: data['notes'].toString(), labelText: "الملاحظات")),
    ),
  ];
}
