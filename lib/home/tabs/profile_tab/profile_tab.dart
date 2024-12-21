import 'package:event_planning_app/home/tabs/profile_tab/dropdown_menu_items.dart';
import 'package:event_planning_app/providers/theme_provider.dart';
import 'package:event_planning_app/utils/app_styles.dart';
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
    var themeMode=Provider.of<ThemeProvider>(context);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: themeMode.isLightMode()?
            AppStyle.bold20black:
            AppStyle.bold20white
          ),
          const SizedBox(
            height: 16,
          ),
          DropdownMenuItemsWidget(AppLocalizations.of(context)!.english,
              AppLocalizations.of(context)!.arabic, DropdownType.language),
          const SizedBox(
            height: 16,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style:themeMode.isLightMode()?
            AppStyle.bold20black:
                AppStyle.bold20white
          ),
          const SizedBox(
            height: 16,
          ),
          DropdownMenuItemsWidget(AppLocalizations.of(context)!.light,
              AppLocalizations.of(context)!.dark, DropdownType.theme),
        ],
      ),
    ));
  }
}
