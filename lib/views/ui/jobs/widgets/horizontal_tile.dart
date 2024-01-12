import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jobdotcom/views/common/exports.dart';
import 'package:jobdotcom/views/common/height_spacer.dart';

import '../../../../models/response/jobs/jobs_response.dart';

class JobHorizontalTile extends StatelessWidget {
  const JobHorizontalTile({super.key, this.onTap, required this.job});
final void Function()? onTap;
final JobsResponse job;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Padding(padding: EdgeInsets.only(right: 12.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        width: width*0.7,
        height: height*0.27,
        color: Color(kLightGrey.value),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(job.imageUrl),),
                SizedBox(width: 15,),
                ReusableText(text: job.company, style: appstyle(26, Color(kDark.value), FontWeight.w600))
              ],
            ),
            HeightSpacer(size: 15),
            ReusableText(text: job.title, style: appstyle(20, Color(kDark.value), FontWeight.w600)),
            ReusableText(text: job.location, style: appstyle(16, Color(kDarkGrey.value), FontWeight.w600)),
            const HeightSpacer(size: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                children: [
                  ReusableText(text: job.salary, style: appstyle(23 , Color(kDark.value), FontWeight.w600)),
                  ReusableText(text: "/${job.period}", style: appstyle(23, Color(kDarkGrey.value), FontWeight.w600)),
                ],
                ),CircleAvatar(radius: 18, backgroundColor: Color(kLight.value), child: Icon(Ionicons.chevron_forward),)

              ],
            ),
          ],
        ),
      ),
      ),


    );
  }
}