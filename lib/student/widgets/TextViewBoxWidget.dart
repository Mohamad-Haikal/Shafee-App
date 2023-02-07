// ignore_for_file:  , file_names

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/resources.dart';

class TextViewBox extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Color? labelColor;
  final Color? hintColor;
  final double? fontSize;

  final int flex;

  const TextViewBox({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.flex,
    this.labelColor,
    this.hintColor,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(15.sp),
          child: TextFormField(
            expands: true,
            maxLines: null,
            minLines: null,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              // constraints: BoxConstraints.expand(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.sp),
              ),
              labelText: labelText,
              hintText: hintText,
              enabled: false,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintTextDirection: TextDirection.rtl,
              alignLabelWithHint: true,

              floatingLabelAlignment: FloatingLabelAlignment.center,
              hintStyle: TextStyle(
                color: hintColor ?? ColorsData.primaryColor,
                fontSize: fontSize ?? 15.sp,
              ),
              labelStyle: TextStyle(
                  color: const Color.fromARGB(255, 114, 114, 114), fontWeight: FontWeight.bold, fontSize: 15.sp, overflow: TextOverflow.visible),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 112, 112, 112),
                ),
                borderRadius: BorderRadius.circular(15.sp),
                gapPadding: 5,
              ),
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }
}
