// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/resources.dart';

class backButtonWidget extends StatelessWidget {
  const backButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 25.sp,
        height: 25.sp,
        decoration: BoxDecoration(color: const Color.fromARGB(255, 236, 230, 247), borderRadius: BorderRadius.all(Radius.circular(17.sp))),
        child: FittedBox(
          fit: BoxFit.cover,
          child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20.sp,
                color: ColorsData.primaryColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
      ),
    );
  }
}
