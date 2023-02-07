// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AttendWidget extends StatelessWidget {
  final String attendDay;
  final String attendDayName;
  final String attendMonthName;
  final int attendStatue;

  const AttendWidget({
    Key? key,
    required this.attendDayName,
    required this.attendDay,
    required this.attendMonthName,
    required this.attendStatue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      attendDayName,
                      style: const TextStyle(fontSize: 17),
                    ),
                    Text(attendDay,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900)),
                    Text(attendMonthName, style: const TextStyle(fontSize: 17)),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Text(
                          attendStatue == 0
                              ? 'حاضر'
                              : attendStatue == 1
                                  ? 'غائب بعذر'
                                  : attendStatue == 2
                                      ? 'غائب بغير عذر'
                                      : 'غير معروف',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
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

  Color checkColor(int statue) {
    switch (statue) {
      case 0:
        return const Color.fromARGB(255, 141, 185, 181);
      case 1:
        return const Color.fromARGB(255, 219, 179, 127);
      case 2:
        return const Color.fromARGB(255, 216, 131, 131);
      default:
        return Colors.white;
    }
  }
}
