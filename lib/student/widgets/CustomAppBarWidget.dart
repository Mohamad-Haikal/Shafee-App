// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/student/widgets/PopUpMenuWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String mainPageTitle;

  CustomAppBarWidget({
    Key? key,
    required this.mainPageTitle,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(mainPageTitle),
      actions: [
        PopUpMenuWidget(
          menuList: [
            const PopupMenuItem(child: Text("Settings")),
            const PopupMenuItem(child: Text("Contact Dev")),
            PopupMenuItem(
              child: Text("Log Out"),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                if (FirebaseAuth.instance.currentUser == null) {
                  final sp = await SharedPreferences.getInstance();
                  sp.clear;
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('تم تسجيل الخروج'),
                    backgroundColor: Colors.green,
                  ));
                  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                }
              },
            )
          ],
        )
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontFamily: "cairo",
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      centerTitle: true,
      leadingWidth: 15.w,
    );
  }
}
