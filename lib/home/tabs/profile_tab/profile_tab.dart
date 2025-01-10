import 'package:event_planning_app/auth/login_screen.dart';
import 'package:event_planning_app/home/tabs/profile_tab/dropdown_menu_items.dart';
import 'package:event_planning_app/providers/theme_provider.dart';
import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:event_planning_app/utils/assets_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var themeMode = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: height * .21,
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
          )),
          title: Row(
            children: [
              Image.asset(
                AssetsManager.routeImage,
                fit: BoxFit.fill,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hanaa Hany",
                        style: AppStyle.bold24baby,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      Text(
                        "hanaahany822@gmail.com",
                        style: AppStyle.medium16baby,
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(AppLocalizations.of(context)!.language,
                  style: themeMode.isLightMode()
                      ? AppStyle.bold20black
                      : AppStyle.bold20white),
              const SizedBox(
                height: 16,
              ),
              DropdownMenuItemsWidget(AppLocalizations.of(context)!.english,
                  AppLocalizations.of(context)!.arabic, DropdownType.language),
              const SizedBox(
                height: 16,
              ),
              Text(AppLocalizations.of(context)!.theme,
                  style: themeMode.isLightMode()
                      ? AppStyle.bold20black
                      : AppStyle.bold20white),
              const SizedBox(
                height: 16,
              ),
              DropdownMenuItemsWidget(AppLocalizations.of(context)!.light,
                  AppLocalizations.of(context)!.dark, DropdownType.theme),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    //logout logic
                    logout();
                  },
                  icon: Image.asset(AssetsManager.logoutIcon),
                  label: Text(
                    AppLocalizations.of(context)!.logout,
                    style: AppStyle.medium20white,
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppColors.redColor),
                    alignment: AlignmentDirectional.centerStart,
                    padding: WidgetStatePropertyAll(EdgeInsets.all(10)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void logout() async{
    await FirebaseAuth.instance.signOut();
    print("Signed out success");
    Navigator.popAndPushNamed(context, LoginScreen.routeName);
  }
}
