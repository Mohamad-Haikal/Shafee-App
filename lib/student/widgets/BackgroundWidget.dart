// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(75),
                  bottomRight: Radius.circular(75)),
              color: Color.fromARGB(255, 214, 245, 243),
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Container(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
