import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdotcom/views/common/app_style.dart';
import 'package:jobdotcom/views/common/height_spacer.dart';

import '../../../../constants/app_constants.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: width, height: height, color: Color(kDarkBlue.value),
      child: Column(
        children: [
          HeightSpacer(size: 65),
          Padding(padding: EdgeInsets.all(8),
          child: Image.asset('assets/images/page2.png'),),
          const HeightSpacer(size: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(' Stable Yourself\nWith Your Ability', style: appstyle(30, Color(kLight.value), FontWeight.w500),),
            HeightSpacer(size: 10),
              Padding(
                padding: EdgeInsets.all(30.h),
                child: Text("We help you find your dream job according to your skills, locations and preferences to build your career", textAlign: TextAlign.center, style: appstyle(14, Color(kLightGrey.value), FontWeight.normal),),
              )
            ],
          )
        ],
      ),),
    );
  }
}