import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobdotcom/constants/app_constants.dart';
import 'package:jobdotcom/controllers/exports.dart';
import 'package:jobdotcom/views/common/app_style.dart';
import 'package:jobdotcom/views/common/height_spacer.dart';
import 'package:jobdotcom/views/ui/device_mgt/widgets/device_info.dart';
import 'package:jobdotcom/views/ui/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:jobdotcom/controllers/onboarding_provider.dart';
import '../../common/app_bar.dart';
import '../../common/drawer/drawer_widget.dart';
import '../../common/reusable_text.dart';

class DeviceManagement extends StatelessWidget {
   const DeviceManagement({super.key});
   @override
   Widget build(BuildContext context) {
     var zoomNotfier =Provider.of<ZoomNotifier>(context);
     var onBoardNotifier =Provider.of<OnBoardNotifier>(context);
String date = DateTime.now().toString();
var loginDate = date.substring(0,11);

    return Scaffold(appBar: PreferredSize(preferredSize: Size.fromHeight(50.h), child: CustomAppBar(
      text: 'Device Management',
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: const DrawerWidget(),
      ),
    ),
    ),
    body: SafeArea(child: Stack(children: [
      Padding(padding: EdgeInsets.symmetric(horizontal: 20.w), child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        HeightSpacer(size: 50),
        Text('Data', style: appstyle(16, Color(kDark.value), FontWeight.normal),),
        HeightSpacer(size: 50),
        DevicesInfo(location: 'Dhanbad', devices: 'poco', platform: 'Android', ipAddress: '21450212123456789', date: loginDate),
      DevicesInfo(location: 'Sijua', devices: 'Panasonic', platform: 'Apple', ipAddress: '214502126', date: loginDate),
      ],),),
      Consumer<LoginNotifier>(builder: (context, LoginNotifier, child){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(onTap: (){onBoardNotifier.isLastPage=false;zoomNotfier.currentIndex=0; Get.to(()=> OnBoardingScreen());}, child: Align(alignment: Alignment.bottomCenter, child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ReusableText(text: 'Sign OuT FROM ALL DEVICES', style: appstyle(16, Color(kOrange.value), FontWeight.w600)),
          ))),
        );
      }

    )]
    )));
  }
}