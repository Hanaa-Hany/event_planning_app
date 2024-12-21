import 'package:event_planning_app/home/tabs/profile_tab/dropdown_menu_items.dart';
import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: AppStyle.bold20black,
          ),
          SizedBox(height: 16,),
          DropdownMenuItemsWidget(AppLocalizations.of(context)!.english,AppLocalizations.of(context)!.arabic),
          SizedBox(height: 16,),

          Text(
            AppLocalizations.of(context)!.theme,
            style: AppStyle.bold20black,
          ),
          SizedBox(height: 16,),

          //DropdownMenuItemsWidget(AppLocalizations.of(context)!.dark,AppLocalizations.of(context)!.light),
        ],
      ),
    ));
  }
}
