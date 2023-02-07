import 'package:flutter/material.dart';
import 'package:shafee_app/resources.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("The Developer is"),
            Text(ColorsData.mainData['developer']!),
          ],
        ),
      ),
    );
  }
}
