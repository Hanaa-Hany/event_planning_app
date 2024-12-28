import 'package:event_planning_app/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../home/home_screen.dart';
import '../utils/app_styles.dart';
import '../utils/assets_manager.dart';
import '../widget/eleveted_btn.dart';
import '../widget/text_field_widget.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "RegisterScreen";

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: width * .04),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(AssetsManager.splashScreen),
                  TextFieldWidget(
                      hintText: AppLocalizations.of(context)!.name,
                      prefixIcon: AssetsManager.nameIcon),
                  SizedBox(
                    height: height * .02,
                  ),
                  TextFieldWidget(
                      hintText: AppLocalizations.of(context)!.email,
                      prefixIcon: AssetsManager.mailIcon),
                  SizedBox(
                    height: height * .02,
                  ),
                  TextFieldWidget(
                      hintText: AppLocalizations.of(context)!.password,
                      prefixIcon: AssetsManager.passIcon),
                  SizedBox(
                    height: height * .02,
                  ),
                  TextFieldWidget(
                      hintText: AppLocalizations.of(context)!.re_pass,
                      prefixIcon: AssetsManager.passIcon),
                  SizedBox(
                    height: height * .02,
                  ),
                  ElevetedBtn(
                    text: AppLocalizations.of(context)!.create_acc,
                    onPressed:(){Navigator.of(context).popAndPushNamed(HomeScreen.routeName);},
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
                ])));
  }
}
