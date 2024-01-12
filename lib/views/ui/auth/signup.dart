import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobdotcom/models/request/auth/signup_model.dart';
import 'package:jobdotcom/views/ui/auth/login.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_constants.dart';
import '../../../controllers/login_provider.dart';
import '../../../controllers/signup_provider.dart';
import '../../common/app_bar.dart';
import '../../common/app_style.dart';
import '../../common/custom_btn.dart';
import '../../common/custom_textfield.dart';
import '../../common/height_spacer.dart';
import '../../common/reusable_text.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
 
 final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    var loginNotifier=Provider.of<LoginNotifier>(context);
    return Consumer<SignUpNotifier>(builder: (context, signupNotifier, child){
      return Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(50), child: CustomAppBar(
          text: "Sign Up!", child: GestureDetector(
          onTap: (){Get.back();}, child: const Icon(CupertinoIcons.arrow_left),
        ),
        )),
        body: Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Form(key: signupNotifier.signupFormKey,
          child: ListView(padding: EdgeInsets.zero,children: [
            HeightSpacer(size: 50),
            ReusableText(text: "Hello Welcome!", style: appstyle(30, Color(kDark.value), FontWeight.w600)),
            ReusableText(text: "Fill the details Sign Up for your account", style: appstyle(18.95 , Color(kDarkGrey.value), FontWeight.w600)),
            HeightSpacer(size: 50),
            CustomTextField(controller: name, hintText: "Your Name", keyboardType: TextInputType.text, validator: (name){
              if(name!.isEmpty){
                return "Please enter a valid name";}
              else{
                return null;
              }
            }),
            HeightSpacer(size: 20),
            CustomTextField(controller: email, hintText: "Email Address", keyboardType: TextInputType.emailAddress, validator: (email){
              if(email!.isEmpty || !email.contains("@")){
                return "Please enter a valid email";}
              else{
                return null;
              }
            }),
            HeightSpacer(size: 20),
            CustomTextField(controller: password, hintText: "Enter Password",obscureText: signupNotifier.isObsecure , keyboardType: TextInputType.emailAddress, validator: (password){
              if (password!.isEmpty || password.length<8){
                return 'Please enter a valid password with at least one Upper case, one Lower case, one symbol, one number';
              }return null;
            },
              suffixIcon: GestureDetector(onTap: (){signupNotifier.isObsecure = !signupNotifier.isObsecure;} ,child: Icon(signupNotifier.isObsecure?Icons.visibility: Icons.visibility_off, color: Color(kDark.value),),),),
            HeightSpacer(size: 10),
            Align(alignment: Alignment.centerRight, child: GestureDetector(onTap: (){Get.offAll(()=> const LoginPage());},child: ReusableText(text: 'Login', style: appstyle(14, Color(kDark.value), FontWeight.w500))),),
            HeightSpacer(size: 50),
            CustomButton( onTap: (){
             loginNotifier.firstTime=!loginNotifier.firstTime;
             if(signupNotifier.validateAndSave()){
               SignupModel model = SignupModel(username: name.text, email: email.text, password: password.text);
               SignUpNotifier signupNotifier = SignUpNotifier();
               signupNotifier.upSignup(model);

             }else{
               Get.snackbar("Sign ap Failed", "Please Check your credentials",
                   colorText: Color(kLight.value),
                   backgroundColor: Colors.red,
                   icon: const Icon(Icons.add_alert)
               );
             }

            }, text: 'Sign Up')


          ]
            ,),
        ),),
      );
    });
  }
}