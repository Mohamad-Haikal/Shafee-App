// ignore_for_file:  , sort_child_properties_last,  , file_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/resources.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: ((p0, p1, p2) {
        return Scaffold(
          body: Stack(
            children: [
              // Align(
              //   alignment: Alignment.bottomRight,
              //   child: SvgPicture.asset(
              //     'assets/images/corner_bottom.svg',
              //     width: 60.w,
              //     height: 35.h,
              //     fit: BoxFit.contain,
              //     alignment: Alignment.bottomRight,
              //   ),
              // ),
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: SvgPicture.asset(
              //     'assets/images/corner_top.svg',
              //     width: 50.w,
              //     height: 35.h,
              //     fit: BoxFit.contain,
              //     alignment: Alignment.topLeft,
              //   ),
              // ),
              Column(
                children: [
                  SizedBox(
                    height: 25.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          ' أهلا بك في تطبيق',
                          style: TextStyle(
                            fontSize: 5.pt,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 1.w),
                        Text(
                          'مركز بشائر النور القرآني',
                          style: TextStyle(
                            fontSize: 5.pt,
                            fontWeight: FontWeight.w900,
                            color: ColorsData.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/images/welcome_svg.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text(
                            'استكشف التطبيق',
                            style: TextStyle(fontSize: 4.pt, color: ColorsData.primaryColor, fontWeight: FontWeight.w700),
                          ),
                          style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(Size(60.w, 9.h)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.sp),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                              elevation: MaterialStateProperty.all(20),
                              shadowColor: MaterialStateProperty.all(ColorsData.themeColor[0])),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Developed by',
                              style: TextStyle(
                                fontSize: 3.5.pt,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/contactUs');
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(EdgeInsets.zero),
                                overlayColor: MaterialStateProperty.all(
                                  Colors.transparent,
                                ),
                              ),
                              child: Text(
                                ColorsData.mainData['developer']!,
                                style: TextStyle(
                                  fontSize: 3.5.pt,
                                  fontWeight: FontWeight.w700,
                                  color: ColorsData.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
