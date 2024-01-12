import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jobdotcom/constants/app_constants.dart';
import 'package:jobdotcom/models/response/jobs/jobs_response.dart';
import 'package:jobdotcom/views/common/exports.dart';

class VerticalTile extends StatelessWidget {
  const VerticalTile({super.key, this.onTap, required this.job});
  final JobsResponse job;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){}, child: Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      height: height*0.15,
      width: width,
      color: Color(kLightGrey.value),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(job!.imageUrl),
                radius: 25,
                backgroundColor: Color(kLightGrey.value),
                ),
                SizedBox(width: 10,),
                Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [ReusableText(text: job!.company, style: appstyle(20, Color(kDark.value), FontWeight.w600)),
                SizedBox(width: width*0.5, child: ReusableText(text: job!.title, style: appstyle(18, Color(kDark.value), FontWeight.w600)),)
                ],),
                CircleAvatar(radius: 18, backgroundColor: Color(kLight.value),
                child: Icon(Ionicons.chevron_forward),)],),
          ],
        ),
        Padding(padding: EdgeInsets.only(left: 12.w,), child: Row(
          children: [
            ReusableText(text: job!.salary, style: appstyle(23, Color(kDark.value),  FontWeight.w600)) ,
            ReusableText(text: "/${job!.period}", style: appstyle(23, Color(kDarkGrey.value),  FontWeight.w600)) ,
          ],
        ),),
      ],
      )
      ,
    ));
  }
}