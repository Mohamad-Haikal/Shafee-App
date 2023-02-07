// ignore_for_file:  ,  , file_names

import 'package:flutter/material.dart';

class PopUpMenuWidget extends StatelessWidget {
  final List<PopupMenuItem> menuList;
  final Widget? icon;

  const PopUpMenuWidget({
    Key? key,
    required this.menuList,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      elevation: 10,
      position: PopupMenuPosition.under,
      padding: const EdgeInsets.only(right: 20),
      itemBuilder: (context) => menuList,
      icon: icon,
    );
  }
}
