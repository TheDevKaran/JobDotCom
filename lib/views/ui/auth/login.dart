import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobdotcom/constants/app_constants.dart';
import 'package:jobdotcom/controllers/exports.dart';
import 'package:jobdotcom/models/request/auth/login_model.dart';
import 'package:jobdotcom/views/common/app_bar.dart';
import 'package:jobdotcom/views/common/custom_btn.dart';
import 'package:jobdotcom/views/common/custom_textfield.dart';
import 'package:jobdotcom/views/common/exports.dart';
import 'package:jobdotcom/views/common/height_spacer.dart';
import 'package:jobdotcom/views/ui/auth/signup.dart';
import 'package:jobdotcom/views/ui/mainscreen.dart';
import 'package:provider/provider.dart';
import 'package:jobdotcom/controllers/login_provider.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Move the getPrefs call to initState or another appropriate lifecycle method
    Provider.of<LoginNotifier>(context, listen: false).getPrefs();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Consumer<LoginNotifier>(builder: (context, loginNotifier, child){

      loginNotifier.getPrefs();
      return Scaffold(
        key: loginNotifier.loginFormKey,
        appBar: PreferredSize(preferredSize: Size.fromHeight(50), child: CustomAppBar(
          text: "Login", child: loginNotifier.entrypoint && loginNotifier.loggedIn? GestureDetector(
          onTap: (){Get.back();}, child: const Icon(CupertinoIcons.arrow_left),
        ): const SizedBox.shrink(),
        )),
        body: Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: ListView(padding: EdgeInsets.zero,children: [
          HeightSpacer(size: 50),
          ReusableText(text: "Welcome Back", style: appstyle(30, Color(kDark.value), FontWeight.w600)),
          ReusableText(text: "Fill the details to login to your account", style: appstyle(30, Color(kDarkGrey.value), FontWeight.w600)),
          HeightSpacer(size: 50),
          CustomTextField(controller: email, hintText: "Email Address", keyboardType: TextInputType.emailAddress, validator: (email){
            if(email!.isEmpty || !email.contains("@")){
              return "Please enter a valid email";}
            else{
              return null;
            }
          }),
          HeightSpacer(size: 20),
          CustomTextField(controller: password, hintText: "Enter Password",obscureText: loginNotifier.obscureText , keyboardType: TextInputType.text, validator: (password){
            if(password!.isEmpty || password.length<7){
              return "Please enter a valid password";}
            else{
              return null;
            }
          },
            suffixIcon: GestureDetector(onTap: (){loginNotifier.obscureText = !loginNotifier.obscureText;} ,child: Icon(loginNotifier.obscureText?Icons.visibility: Icons.visibility_off, color: Color(kDark.value),),),),
          HeightSpacer(size: 10),
          Align(alignment: Alignment.centerRight, child: GestureDetector(onTap: (){Get.offAll(()=> const RegistrationPage());},child: ReusableText(text: 'Register', style: appstyle(14, Color(kDark.value), FontWeight.w500))),),
          HeightSpacer(size: 50),
          CustomButton(text: 'Login', onTap: (){
            if(email.text.isNotEmpty && password.text.isNotEmpty)
            {
              print("sd");
              LoginModel model = LoginModel(
            email: email.text, password: password.text);
            loginNotifier.userLogin(model);
          }
          else{
            Get.snackbar("Sign Failed", "Please Check your",
                colorText: Color(kLight.value),
                backgroundColor: Colors.red,
                icon: const Icon(Icons.add_alert)
            );

          }
          }
          )
        ],
        ),
        ),
      );
    });
  }
}