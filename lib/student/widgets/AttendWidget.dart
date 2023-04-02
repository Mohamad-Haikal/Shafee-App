// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AttendWidget extends StatelessWidget {
  final Timestamp timeStamp;
  final String attendStatue;

  const AttendWidget({
    Key? key,
    required this.timeStamp,
    required this.attendStatue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String attendMonth = DateFormat('M').format(DateTime.parse(timeStamp.toDate().toLocal().toString()));
    String attendDay = DateFormat('d').format(DateTime.parse(timeStamp.toDate().toLocal().toString()));
    String attendDayName = DateFormat('EEEE').format(DateTime.parse(timeStamp.toDate().toLocal().toString()));
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        color: checkColor(attendStatue),
        margin: const EdgeInsets.symmetric(vertical: 10),
        elevation: 10,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${attendMonth}/${attendDay}', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
                    Text(
                      dayNameTranslator(attendDayName),
                      style: const TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Text(
                          attendStatue == "2"
                              ? 'حاضر'
                              : attendStatue == "1"
                                  ? 'غائب بعذر'
                                  : attendStatue == "0"
                                      ? 'غائب بغير عذر'
                                      : 'غير معروف',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Color checkColor(String statue) {
    switch (statue) {
      case "2":
        return const Color.fromARGB(255, 141, 185, 181);
      case "1":
        return const Color.fromARGB(255, 219, 179, 127);
      case "0":
        return const Color.fromARGB(255, 216, 131, 131);
      default:
        return Colors.white;
    }
  }

  String dayNameTranslator(String dayName) {
    switch (dayName) {
      case "Sunday":
        return 'الأحد';
      case "Monday":
        return 'الاثنين';
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
        return 'غير معروف';
    }
  }
}
