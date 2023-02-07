// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shafee_app/resources.dart';
import 'package:shafee_app/services/firebase.dart';
import 'package:shafee_app/student/screens/StudentDashboardScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  bool isLoginPhone = false;
  bool isObscure = true;
  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          body: Column(
            children: [
              //  Title Text "تسجيل الدخول"
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'تسجيل الدخول',
                      style: TextStyle(fontSize: 6.pt, fontWeight: FontWeight.w700, color: ColorsData.primaryColor),
                    ),

                    //  Sub Text "يرجى تسجيل بيانات حسابك"
                    Text(
                      'يرجى ادخال بيانات حسابك',
                      style: TextStyle(fontSize: 4.3.pt, fontWeight: FontWeight.w400, color: ColorsData.primaryColor),
                    ),
                  ],
                ),
              ),

              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 35,
                        offset: Offset(0, 20),
                      )
                    ],
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30.sp), topRight: Radius.circular(30.sp)),
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /*isLoginPhone
                       Phone Number Input Field
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 65.w,
                              height: 6.5.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(Radius.circular(15)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 4,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                expands: true,
                                cursorColor: ColorsData.primaryColor,
                                cursorRadius: const Radius.circular(10),
                                keyboardType: TextInputType.phone,
                                toolbarOptions: const ToolbarOptions(paste: true),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(9),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                style: TextStyle(
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                ),
                                decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  hintTextDirection: TextDirection.rtl,
                                  floatingLabelAlignment: FloatingLabelAlignment.center,
                                  contentPadding: EdgeInsets.only(bottom: 20.sp),
                                  hoverColor: ColorsData.primaryColor,
                                  prefixStyle: TextStyle(
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.sp,
                                  ),
                                  labelStyle: TextStyle(
                                    letterSpacing: 0,
                                    fontSize: 18.sp,
                                  ),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                  labelText: 'رقم الهاتف',
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(left: 15, top: 8, right: 3),
                                    child: Text(
                                      '+962',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                textAlign: TextAlign.left,
                                maxLines: null,
                              ),
                            ),
                            //  Space between InputField and Sumbit Button
                            const SizedBox(
                              height: 25,
                            ),
                          ],
                        )
                       Email and password Input Field
                      */
                      SizedBox(
                        height: 7.h,
                      ),
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            children: [
                              SizedBox(
                                child: TextFormField(
                                  controller: emailCtrl,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'يرجى إدخال بريدك الإلكتروني';
                                    }
                                    if (!isEmail(value)) {
                                      return '';
                                    } else {
                                      return null;
                                    }
                                  },
                                  cursorColor: ColorsData.primaryColor,
                                  cursorRadius: const Radius.circular(10),
                                  keyboardType: TextInputType.emailAddress,
                                  toolbarOptions: const ToolbarOptions(paste: true),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(25),
                                  ],
                                  style: TextStyle(
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                  ),
                                  decoration: InputDecoration(
                                    // isDense: true,

                                    filled: true,
                                    fillColor: Colors.white,
                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                    floatingLabelAlignment: FloatingLabelAlignment.center,
                                    labelStyle: TextStyle(
                                      letterSpacing: 0,
                                      fontSize: 16.sp,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(vertical: 13.sp, horizontal: 20.sp),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.sp), borderSide: BorderSide(color: Colors.amber, width: 1)),
                                    focusColor: ColorsData.primaryColor,
                                    iconColor: ColorsData.primaryColor,
                                    labelText: 'البريد الإلكتروني',
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                              SizedBox(
                                height: 15.sp,
                              ),
                              SizedBox(
                                child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  controller: passCtrl,
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 6) {
                                      return 'يرجى إدخال كلمة مرور صحيحة';
                                    }
                                    return null;
                                  },
                                  obscureText: isObscure ? true : false,
                                  cursorColor: ColorsData.primaryColor,
                                  cursorRadius: const Radius.circular(10),
                                  keyboardType: TextInputType.emailAddress,
                                  toolbarOptions: const ToolbarOptions(paste: true),
                                  textAlignVertical: TextAlignVertical.center,
                                  inputFormatters: [LengthLimitingTextInputFormatter(254), FilteringTextInputFormatter.deny(' ')],
                                  style: TextStyle(
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.sp), borderSide: BorderSide(color: ColorsData.primaryColor)),
                                    iconColor: ColorsData.primaryColor,
                                    focusColor: ColorsData.primaryColor,
                                    suffixIcon: IconButton(
                                      splashRadius: 1,
                                      tooltip: isObscure ? 'عرض كلمة المرور' : 'إخفاء كلمة المرور',
                                      onPressed: () {
                                        setState(() {
                                          isObscure = !isObscure;
                                        });
                                      },
                                      icon: Icon(isObscure ? Icons.remove_red_eye_outlined : Icons.remove_red_eye_rounded),
                                    ),
                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                    floatingLabelAlignment: FloatingLabelAlignment.center,
                                    contentPadding: EdgeInsets.symmetric(vertical: 13.sp, horizontal: 20.sp),
                                    labelStyle: TextStyle(
                                      letterSpacing: 0,
                                      fontSize: 18.sp,
                                    ),
                                    labelText: 'كلمة المرور',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                      ),

                      //  Submit Button
                      TextButton(
                        onPressed: () async {
                          showDialog(context: context, builder: (context) => Center(child: CircularProgressIndicator()));
                          if (_formKey.currentState!.validate()) {
                            UserCredential? login =
                                await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailCtrl.text, password: passCtrl.text).onError(
                              (FirebaseAuthException error, stackTrace) {
                                print(error.code);
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: error.code == 'user-not-found'
                                        ? Text('لم يتم العثور على الحساب... يرجى التأكد من عنوان البريد الألكتروني')
                                        : error.code == 'wrong-password'
                                            ? Text('يرجى إدخال كلمة مرور صحيحة')
                                            : error.code == 'user-disabled'
                                                ? Text('الحساب مقفول حاليا... يرجى التواصل مع المسؤول')
                                                : Text('يرجى التأكد من عنوان البريد الالكتروني'),
                                    backgroundColor: Colors.redAccent,
                                  ),
                                );
                                return null as UserCredential;
                              },
                            );
                            if (FirebaseAuth.instance.currentUser == null) {
                              Navigator.pop(context);
                              Navigator.pushReplacementNamed(context, '/login');
                            } else {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text('تم تسجيل الدخول'),
                                backgroundColor: Colors.green,
                              ));
                              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text('يرجى تعبئة جميع الحقول'),
                              backgroundColor: Colors.redAccent,
                            ));
                          }
                        },
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
                        child: Text(
                          'تسجيل الدخول',
                          style: TextStyle(fontSize: 4.pt, color: ColorsData.primaryColor, fontWeight: FontWeight.w700),
                        ),
                      ),

                      //  Description Text "يمكنك الحصول على بيانات حسابك من خلال التواصل مع معلمك"
                      Container(
                        padding: EdgeInsets.only(top: 5.h),
                        width: 75.w,
                        child: Text(
                          '* يمكنك الحصول على بيانات حسابك من خلال التواصل مع معلمك',
                          style: TextStyle(
                            fontSize: 3.5.pt,
                            fontWeight: FontWeight.w400,
                            color: ColorsData.primaryColor,
                          ),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //  Change Login Method
              // isLoginPhone
              //     ? TextButton(
              //         onPressed: () {
              //           setState(() {
              //             isLoginPhone = false;
              //           });
              //         },
              //         style: ButtonStyle(
              //           padding: MaterialStateProperty.all(EdgeInsets.zero),
              //           overlayColor: MaterialStateProperty.all(
              //             Colors.transparent,
              //           ),
              //         ),
              //         child: Text(
              //           "تسجيل الدخول بالبريد الالكتروني",
              //           style: TextStyle(
              //             fontSize: 17.sp,
              //             fontWeight: FontWeight.w500,
              //             color: ColorsData.primaryColor,
              //           ),
              //         ),
              //       )
              //     : TextButton(
              //         onPressed: () {
              //           setState(() {
              //             isLoginPhone = true;
              //           });
              //         },
              //         style: ButtonStyle(
              //           padding: MaterialStateProperty.all(EdgeInsets.zero),
              //           overlayColor: MaterialStateProperty.all(
              //             Colors.transparent,
              //           ),
              //         ),
              //         child: Text(
              //           "تسجيل الدخول برقم الهاتف",
              //           style: TextStyle(
              //             fontSize: 17.sp,
              //             fontWeight: FontWeight.w500,
              //             color: ColorsData.primaryColor,
              //           ),
              //         ),
              //       )
            ],
          ),
        );
      },
    );
  }
}
