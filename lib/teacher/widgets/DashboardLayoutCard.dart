// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardLayoutCards extends StatelessWidget {
  final Function() onTap;
  final Widget cardContent;
  final bool isInkWell;
  const DashboardLayoutCards({
    Key? key,
    required this.onTap,
    required this.cardContent,
    required this.isInkWell,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      color: const Color.fromARGB(255, 236, 230, 247),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.sp),
      ),
      elevation: 0,
      child: isInkWell
          ? InkWell(
              borderRadius: BorderRadius.circular(20.sp),
              splashColor: const Color.fromARGB(57, 97, 71, 170),
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: onTap,
              child: cardContent,
            )
          : cardContent,
    );
  }
}
