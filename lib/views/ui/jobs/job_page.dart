import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/_http/_html/_http_request_html.dart';
import 'package:jobdotcom/constants/app_constants.dart';
import 'package:jobdotcom/controllers/exports.dart';
import 'package:jobdotcom/views/common/app_bar.dart';
import 'package:jobdotcom/views/common/custom_outline_btn.dart';
import 'package:jobdotcom/views/common/exports.dart';
import 'package:jobdotcom/views/common/height_spacer.dart';
import 'package:provider/provider.dart';
import 'package:jobdotcom/views/common/vertical_tile.dart';

import 'widgets/horizontal_shimmer.dart';

class JobPage extends StatefulWidget {
  const JobPage({super.key, required this.title, required this.id}); 
  final String title;
  final String id;

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<JobsNotifier>(builder: (context, jobsNotifier, child){
      jobsNotifier.getJobs(widget.id);
      return Scaffold(appBar: PreferredSize(child: CustomAppBar(child: GestureDetector(onTap: ()=> Get.back(), child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Icon(CupertinoIcons.arrow_left),
      ),),actions: [Icon(Entypo.bookmark,)],text: widget.title,),preferredSize: Size.fromHeight(50.h),),
        body: FutureBuilder(future: jobsNotifier.job, builder:(context, snapshot){
    if(snapshot.connectionState==ConnectionState.waiting){return const Center(child: CircularProgressIndicator());}
    else if(snapshot.hasError){return Text("Error ${snapshot.error}");}
          else{
            final job=snapshot.data;
            return Padding(padding: EdgeInsets.symmetric(horizontal: 20,), child: Stack(
              children: [
                ListView(padding: EdgeInsets.all(0), children: [
                  HeightSpacer(size: 12),
                  Container(width: width, height: height*0.27,color: Color(kLightGrey.value),child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                    CircleAvatar(backgroundImage: NetworkImage(job!.imageUrl),),
                    const HeightSpacer(size: 10),
                    ReusableText(text: job!.title, style: appstyle(22, Color(kDark.value), FontWeight.w600)),
                    const HeightSpacer(size: 5),
                    ReusableText(text: 'Kolkata', style: appstyle(22, Color(kDarkGrey.value), FontWeight.normal)),
                    HeightSpacer(size: 15),
                    Padding(padding: EdgeInsets.all(15), child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      CustomOutlineBtn(color: Color(kOrange.value), text: 'full time',width: width*0.26, height: height*0.04, color2: Color(kLight.value),),
                      Row(
                        children: [
                          ReusableText(text: '10k', style: appstyle(22, Color(kDark.value), FontWeight.w600)),
                          SizedBox(width: width*0.2, child: ReusableText(text: '/monthly', style: appstyle(22, Color(kDark.value), FontWeight.w600))),
                        ],
                      )
                    ],
                    ),)

                  ],),),
                  const HeightSpacer(size: 20),
                  ReusableText(text: 'Job Descriptions', style: appstyle(22, Color(kDark.value), FontWeight.w500)),
                  const HeightSpacer(size: 10),
                  Text(desc, textAlign: TextAlign.justify, maxLines: 8, style: appstyle(16, Color(kDarkGrey.value), FontWeight.normal),),
                  HeightSpacer(size: 20),
                  ReusableText(text: 'Requirements', style: appstyle(22, Color(kDark.value), FontWeight.w500)),
                  HeightSpacer(size: 10),
                  SizedBox(height: height*0.6, child: ListView.builder(physics: const NeverScrollableScrollPhysics(), itemCount: requirements.length,itemBuilder: (context, index){final req = requirements[index]; String bullet = '\u2022'; return Text('$bullet $req/n', maxLines: 3, style: appstyle(16, Color(kDarkGrey.value), FontWeight.normal),textAlign: TextAlign.justify);}),),
                  HeightSpacer(size: 20),
                ],),
                Align(alignment: Alignment.bottomCenter, child: Padding(padding: EdgeInsets.only(bottom: 20.h), child: CustomOutlineBtn(text: 'Apply Now', color2: Color(kOrange.value), width: width, height: height*0.6, color: Color(kLight.value),onTap: (){},),),)


              ],
            ),);
          }
        }),
      );;
    });
  }
}