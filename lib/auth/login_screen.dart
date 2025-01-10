import 'package:event_planning_app/auth/register_screen.dart';
import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:event_planning_app/utils/assets_manager.dart';
import 'package:event_planning_app/widget/custom_elevated_btn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../home/home_screen.dart';
import '../widget/custom_text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "LoginScreen";

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();

  TextEditingController passController=TextEditingController();

  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: width * .04),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AssetsManager.splashScreen),
            CustomTextFieldWidget(
                hintText: AppLocalizations.of(context)!.email,
                prefixIcon: AssetsManager.mailIcon,
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            validator: (email){
                  if(email!.trim().isEmpty){
                    return "please enter your mail";
                  }
                  return null;
            },),
            SizedBox(height: height*.02,),
            CustomTextFieldWidget(
                hintText: AppLocalizations.of(context)!.password,
                prefixIcon: AssetsManager.passIcon,
            obscureText: true,
            keyboardType: TextInputType.number,
            controller: passController,
              validator: (pass){
                if(pass!.trim().isEmpty){
                  return "please enter your pass";
                }
                return null;
              },
            ),
            SizedBox(height: height*.02,),
            Container(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                AppLocalizations.of(context)!.forget_pass,
                style: AppStyle.bold16primaryItalic,
              ),
            ),
            SizedBox(height: height*.02,),
            CustomElevatedBtn(
              text: AppLocalizations.of(context)!.login,
              onPressed:(){
                //login logic
                login();
                },
            ),
            SizedBox(height: height*.02,),
            InkWell(
              onTap: () {
                Navigator.of(context).popAndPushNamed(RegisterScreen.routeName);
              },
              child: Container(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    children:[
                      TextSpan(text:AppLocalizations.of(context)!.dont_have_acc,style: AppStyle.medium16black),
                      TextSpan(text:AppLocalizations.of(context)!.create_acc,style: AppStyle.medium16primary)
                    ]

                  )
                ),
              ),
            ),
            SizedBox(height: height*.02,),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    height: 1,
                    color: AppColors.primaryColor,
                    indent: width*.066,
                    endIndent: width*.066,
                  ),
                ),
                Text(AppLocalizations.of(context)!.or,style: AppStyle.medium16primary,),
                Expanded(
                  child: Divider(height: 2,
                    color: AppColors.primaryColor,
                    indent: width*.066,
                    endIndent: width*.066,),
                )
              ],
            ),
            SizedBox(height: height*.02,),
            OutlinedButton.icon(
              onPressed: () {},

              label: Text(
                AppLocalizations.of(context)!.login_with_google,
                style: AppStyle.medium20primary,
              ),
              icon: ImageIcon(AssetImage(AssetsManager.googleIcon)),
              //padding: WidgetStatePropertyAll(EdgeInsets.all(10)),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                  padding: WidgetStatePropertyAll(EdgeInsets.all(10)),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
            )
          ],
        ),
      ),
    ));
  }

  void login() async{
    if(formKey.currentState?.validate()==true){
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text,
            password: passController.text
        );
        print("Login Success");
        Navigator.of(context).popAndPushNamed(HomeScreen.routeName);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }else if (e.code == 'invalid-credential') {
          print('The supplied auth credential is incorrect, malformed or has expired.');
        }
        else {
          print(e.code);
        }
      }

    }

  }
}
