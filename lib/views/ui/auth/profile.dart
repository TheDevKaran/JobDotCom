
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:jobdotcom/constants/app_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jobdotcom/controllers/exports.dart';
import 'package:jobdotcom/models/response/auth/profile_model.dart';
import 'package:jobdotcom/views/common/exports.dart';
import 'package:jobdotcom/views/common/height_spacer.dart';
import 'package:jobdotcom/views/ui/auth/profile_update.dart';
import 'package:provider/provider.dart';
import '../../common/app_bar.dart';
import '../../common/drawer/drawer_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});


  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {



    return Scaffold(appBar: PreferredSize(preferredSize: Size.fromHeight(50.h), child: CustomAppBar(
      text: 'Profile',
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: const DrawerWidget(),
      ),
    ),
    ),
    body: Consumer<ProfileNotifier>(builder: (context, profileNotifier, child){
      profileNotifier.getProfile();
      return FutureBuilder<ProfileRes>(
        future: profileNotifier.profile,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if (snapshot.hasError){
            return Text('Error ${snapshot.error}');
          }else {
            final UserData = snapshot.data;
          }
          var UserData;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView(padding: EdgeInsets.zero, children: [Container(
              width: width, height: height*0.12, color: Color((kLight.value)), child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),child: CachedNetworkImage(imageUrl: UserData!.profile, width: 80.w, height: 100.h,),),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                    ReusableText(text: UserData.username, style: appstyle(20, Color(kDark.value), FontWeight.w600)),
                    Row(children: [Icon(MaterialIcons.location_pin, color: Color(kDarkGrey.value),), SizedBox(width: 5,),
                      ReusableText(text: UserData.location, style: appstyle(20, Color(kDarkGrey.value), FontWeight.w600)),],)
                  ],),

                ],
              ),GestureDetector(onTap: (){
                profile = UserData.skills;
                Get.to(()=> ProfileUpdate());},child: Icon(Feather.edit, size: 18,),),
            ],
            ),
            ),
              HeightSpacer(size: 20),
              Stack(children: [Container(width: width,height: height*0.12,color: Color(kLightGrey.value), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Container(margin: EdgeInsets.only(left: 12),width: 60, height: 70, color: Color(kLight.value), child: Icon(FontAwesome5Regular.file_pdf, color: Colors.red, size: 40,),),
                Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                  ReusableText(text: 'Resume from Jobdotcom', style: appstyle(18, Color(kDark.value), FontWeight.w600)),
                  ReusableText(text: 'Jobdotcom Resume', style: appstyle(16, Color(kDarkGrey.value), FontWeight.w600)),
                ],),
                SizedBox(width: 1,)
              ],),),       Positioned(top:2.h, right: 5.w, child: GestureDetector(onTap: (){}, child: ReusableText(text: 'Edit', style: appstyle(18, Color(kOrange.value), FontWeight.w600)),))],
              ),
              HeightSpacer(size: 20),
              Container(padding: EdgeInsets.only(left: 8.w),width: width, height: height*0.06, color: Color(kLightGrey.value),child: Align(alignment: Alignment.centerLeft,child: ReusableText(text: UserData.email, style: appstyle(16, Color(kDark.value), FontWeight.w600)),),),
              HeightSpacer(size: 20),
              Container(padding: EdgeInsets.only(left: 8.w),width: width, height: height*0.06, color: Color(kLightGrey.value),child: Align(alignment: Alignment.centerLeft,child: Row(
                children: [ SvgPicture.asset('assets/icons/ind.svg', height: 20.w, width: 40.h,), const SizedBox(width: 15,),
                  ReusableText(text: UserData.phone, style: appstyle(16, Color(kDark.value), FontWeight.w600)),
                ],
              ),),),
              HeightSpacer(size: 20),
              Container(color: Color(kLightGrey.value),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Padding(padding: EdgeInsets.all(8.h), child: ReusableText(text: 'Skills', style: appstyle(12, Color(kDark.value), FontWeight.w600)),
              ), SizedBox(height: height*0.5,child: Padding(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8), child: ListView.builder(itemCount:UserData.skills.length, itemBuilder: (context, index){final skill=UserData.skills[index]; return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(padding: EdgeInsets.symmetric(horizontal: 10), width: width, height: height*0.06,color: Color(kLight.value),child: ReusableText(text: skill, style: appstyle(16, Color(kDark.value), FontWeight.normal)),
                ),
              );})),)],),)
            ],),
          );
        }
      );
    })
    );
  }

}