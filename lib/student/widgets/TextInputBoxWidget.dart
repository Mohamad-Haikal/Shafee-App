// ignore_for_file:  , file_names

import 'package:flutter/material.dart';

class TextInputBoxWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool enabled;

  const TextInputBoxWidget(
      {Key? key,
      required this.hintText,
      required this.labelText,
      required this.enabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(15),
          child: TextFormField(
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 112, 112, 112),
                ),
                borderRadius: BorderRadius.circular(15),
                gapPadding: 5,
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 112, 112, 112),
                ),
                borderRadius: BorderRadius.circular(15),
                gapPadding: 5,
              ),
              labelText: labelText,
              hintText: hintText,
              enabled: enabled,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              floatingLabelAlignment: FloatingLabelAlignment.center,
              hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 98, 71, 170), fontSize: 14),
              labelStyle: const TextStyle(
                  color: Color.fromARGB(255, 114, 114, 114),
                  fontWeight: FontWeight.w500,
                  fontSize: 19),
            ),
          ),
        ),
      ),
    );
  }
}
