// ignore_for_file:  , file_names

import 'package:flutter/material.dart';

class PointsLogListElementWidget extends StatelessWidget {
  final Color circleColor;
  final String discription;
  final int points;
  final String date;
  const PointsLogListElementWidget(
      {Key? key,
      required this.circleColor,
      required this.discription,
      required this.points,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(Icons.circle, color: circleColor),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    textDirection: TextDirection.rtl,
                    children: [
                      Text('$points',
                          style: const TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(
                        width: 5,
                      ),
                      // Text(
                      //   points > 2 && points < 11 ? 'نقاط' : 'نقطة',
                      //   style: TextStyle(fontSize: 10),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                  child: VerticalDivider(
                    thickness: 1,
                    width: 5,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      date,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                  child: VerticalDivider(
                    thickness: 1,
                    width: 5,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Center(
                    child: Text(
                      discription,
                      style: const TextStyle(fontSize: 13),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
