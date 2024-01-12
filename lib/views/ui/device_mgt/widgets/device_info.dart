import 'package:flutter/material.dart';
import 'package:jobdotcom/views/common/custom_outline_btn.dart';
import 'package:jobdotcom/views/common/exports.dart';
import 'package:jobdotcom/views/common/height_spacer.dart';
class DevicesInfo extends StatelessWidget {
  const DevicesInfo({super.key, required this.location, required this.devices, required this.platform, required this.ipAddress, required this.date});
final String location;
final String devices;
final String platform;
final String ipAddress;
final String date;
  @override
  Widget build(BuildContext context) {
    return  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ReusableText(text: platform, style: appstyle(22, Color(kDark.value), FontWeight.bold)),
      ReusableText(text: devices, style: appstyle(22, Color(kDark.value), FontWeight.bold)),
      HeightSpacer(size: 15),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ReusableText(text: date, style: appstyle(16, Color(kDark.value), FontWeight.w400)),
          ReusableText(text: ipAddress, style: appstyle(16, Color(kDark.value), FontWeight.w400)),

        ],),
        CustomOutlineBtn(color: Color(kOrange.value), text: 'Sign OuT',height: height*0.05, width: 80, color2: Colors.white,)
      ],)


    ],);
  }
}
