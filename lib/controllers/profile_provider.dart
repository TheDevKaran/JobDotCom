import 'package:flutter/material.dart';
import 'package:jobdotcom/services/helpers/auth_helper.dart';
import '../models/response/auth/profile_model.dart';

class ProfileNotifier extends ChangeNotifier {
  Future<ProfileRes>? profile;
  getProfile() async{
    profile=  AuthHelper.getProfile();

  }
 
}
