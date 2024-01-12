import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobdotcom/views/common/custom_outline_btn.dart';
import 'package:jobdotcom/views/common/exports.dart';
import 'package:jobdotcom/views/common/height_spacer.dart';
import 'package:jobdotcom/views/ui/auth/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/app_constants.dart';
import '../../auth/login.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: width, height: height, color: Colors.blue, child: Column(children: [
        Image.asset("assets/images/page3.png"),
        HeightSpacer(size: 20),
        ReusableText(text: "Welcome to Jobdotcom", style: appstyle(30, Color(kLight.value), FontWeight.w600)),
        const HeightSpacer(size: 15),
        Padding(padding: EdgeInsets.symmetric(horizontal: 38.w),
        child: Text('We help you find your dream job to your skillset, location and preference to build your career', textAlign: TextAlign.center,
        style: appstyle(14, Color(kLight.value), FontWeight.normal),),),
        const HeightSpacer(size: 20),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomOutlineBtn(color: Color(kLight.value), color2: Colors.blue ,onTap: () async {final SharedPreferences prefs = await SharedPreferences.getInstance(); await prefs.setBool('entrypoint', true);  Get.to(() => const LoginPage()); },width: width*0.4,height: height*0.06,text: "Login",  ),
      GestureDetector(onTap: (){Get.to(()=> RegistrationPage());}, child: Container(width:width*0.4,height: height*0.06, color: Color(kLight.value),child: Center(child: ReusableText(text: "Sign Up", style: appstyle(16, Colors.blue, FontWeight.w600),)),),
      )
          ],
        ),
        HeightSpacer(size: 30),
        ReusableText(text: "Continue as Guest", style: appstyle(16, Color(kLight.value), FontWeight.w400))
      ],),),
    );
  }
}