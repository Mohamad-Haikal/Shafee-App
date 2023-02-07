// ignore_for_file:  ,  , must_be_immutable, file_names

import 'package:flutter/material.dart';

class TopsWidget extends StatelessWidget {
  String name;
  int rank;
  static List<Color> listOfColor = [
    const Color(0xFF8DB9B5),
    const Color(0xFF89A5B3),
    const Color(0xFFC09689),
    const Color(0xFF937DB9),
    const Color(0xFF7E87B6),
    const Color(0xFFBB8194),
  ];
  TopsWidget({Key? key, required this.name, required this.rank})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: rank == 1
          ? 120
          : rank == 2
              ? 110
              : rank == 3
                  ? 100
                  : 90,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10),
        elevation: 10,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: checkColor(rank),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(
                      rank.toString(),
                      style: TextStyle(
                          fontWeight:
                              rank <= 3 ? FontWeight.w900 : FontWeight.w600,
                          fontSize: rank == 1
                              ? 30
                              : rank == 2
                                  ? 25
                                  : rank == 3
                                      ? 20
                                      : 15),
                    ))
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Center(
                  child: Text(
                name,
                style: TextStyle(
                  fontWeight: rank == 1
                      ? FontWeight.w900
                      : rank == 2
                          ? FontWeight.w800
                          : rank == 3
                              ? FontWeight.w700
                              : FontWeight.w600,
                  fontSize: rank == 1
                      ? 20
                      : rank == 2
                          ? 18
                          : rank == 3
                              ? 16
                              : 13,
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }

  Color checkColor(int rank) {
    switch (rank) {
      case 1:
        return const Color.fromARGB(255, 255, 215, 83);
      case 2:
        return const Color.fromARGB(255, 167, 179, 185);
      case 3:
        return const Color.fromARGB(255, 211, 165, 120);
      default:
        return const Color.fromARGB(255, 236, 230, 247);
    }
  }
}
