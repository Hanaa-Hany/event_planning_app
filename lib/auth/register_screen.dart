import 'package:event_planning_app/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../home/home_screen.dart';
import '../utils/app_styles.dart';
import '../utils/assets_manager.dart';
import '../widget/custom_elevated_btn.dart';
import '../widget/custom_text_field_widget.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "RegisterScreen";

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController=TextEditingController();

  TextEditingController emailController=TextEditingController();

  TextEditingController passController=TextEditingController();

  TextEditingController repassController=TextEditingController();

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
                        hintText: AppLocalizations.of(context)!.name,
                        prefixIcon: AssetsManager.nameIcon,
                    controller: nameController,
                    validator: (name){
                          if(name!.trim().isEmpty){
                            return "please enter Your Name";
                          }
                          return null;
                    },),
                    SizedBox(
                      height: height * .02,
                    ),
                    CustomTextFieldWidget(
                        hintText: AppLocalizations.of(context)!.email,
                        prefixIcon: AssetsManager.mailIcon,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                      validator: (email){
                        final bool emailValid =
                        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(email!);
                        if(email.trim().isEmpty){
                          return "please enter Your Email";
                        }else if(!emailValid){
                          return "Email not valid";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    CustomTextFieldWidget(
                        hintText: AppLocalizations.of(context)!.password,
                        prefixIcon: AssetsManager.passIcon,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      controller: passController,
                      validator: (pass){
                        if(pass!.trim().isEmpty){
                          return "please enter Your pass";
                        }else if(pass.length<6){
                          return "your pass is less than 6";
                        }
                        return null;
                      },),
                    SizedBox(
                      height: height * .02,
                    ),
                    CustomTextFieldWidget(
                        hintText: AppLocalizations.of(context)!.re_pass,
                        prefixIcon: AssetsManager.passIcon,
                        keyboardType: TextInputType.number,
                    obscureText: true,
                    controller: repassController,
                        validator: (rePass){
                          if(rePass!.trim().isEmpty){
                            return "please enter Your pass";
                          }else if(rePass!=passController.text){
                            return "not confirm";
                          }
                          return null;
                        }),
                    SizedBox(
                      height: height * .02,
                    ),
                    CustomElevatedBtn(
                      text: AppLocalizations.of(context)!.create_acc,
                      onPressed:(){
                        register();
                        },
                    ),
                    SizedBox(height: height*.02,),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).popAndPushNamed(LoginScreen.routeName);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text.rich(
                            TextSpan(
                                children:[
                                  TextSpan(text:AppLocalizations.of(context)!.already_have_acc,style: AppStyle.medium16black),
                                  TextSpan(text:AppLocalizations.of(context)!.login,style: AppStyle.medium16primary)
                                ]

                            )
                        ),
                      ),
                    ),
                  ]),
            )));
  }


  void register() async{
    if(formKey.currentState?.validate()==true){
      try {
        print("hiiiiiiiiiii");
        print(emailController.text);
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passController.text,
        );
        Navigator.of(context).popAndPushNamed(HomeScreen.routeName);
        print(credential.user?.email);
        print("Register Success");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }



  }
}
