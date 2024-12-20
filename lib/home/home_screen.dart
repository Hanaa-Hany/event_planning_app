import 'package:event_planning_app/home/tabs/home_tab/home_tab.dart';
import 'package:event_planning_app/home/tabs/love_tab/love_tab.dart';
import 'package:event_planning_app/home/tabs/map_tab/map_tab.dart';
import 'package:event_planning_app/home/tabs/profile_tab/profile_tab.dart';
import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:event_planning_app/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 4,
          color: AppColors.primaryColor,
          padding: EdgeInsets.all(0),
          child: BottomNavigationBar(
            unselectedLabelStyle: AppStyle.bold12white,
            selectedItemColor: AppColors.whiteColor,
            unselectedItemColor: AppColors.whiteColor,
            selectedLabelStyle: AppStyle.bold12white,
            items: [
              buildBottomNavigationBarItems(
                  selectedIcon: AssetsManager.selectedHome,
                  label: AppLocalizations.of(context)!.home,
                  unselectedIcon: AssetsManager.unselectedHome,
                  index: 0),
              buildBottomNavigationBarItems(
                  selectedIcon: AssetsManager.selectedMap,
                  label: AppLocalizations.of(context)!.map,
                  unselectedIcon: AssetsManager.unselectedMap,
                  index: 1),
              buildBottomNavigationBarItems(
                  selectedIcon: AssetsManager.selectedLove,
                  label: AppLocalizations.of(context)!.love,
                  unselectedIcon: AssetsManager.unselectedLove,
                  index: 2),
              buildBottomNavigationBarItems(
                  selectedIcon: AssetsManager.selectedProfile,
                  label: AppLocalizations.of(context)!.profile,
                  unselectedIcon: AssetsManager.unselectedProfile,
                  index: 3),
            ],
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
              print(selectedIndex);
            },
             backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
            elevation: 0,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //add new Event
          },
          shape: const StadiumBorder(
              side: BorderSide(width: 5, color: AppColors.whiteColor)),
          backgroundColor: AppColors.primaryColor,
          child: const Icon(
            Icons.add,
            color: AppColors.whiteColor,
            size: 30,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: selectedTap());
  }

  BottomNavigationBarItem buildBottomNavigationBarItems(
      {required String selectedIcon,
      required String unselectedIcon,
      required String label,
      required int index}) {
    return BottomNavigationBarItem(
        icon: index == selectedIndex
            ? Image.asset(selectedIcon)
            : Image.asset(unselectedIcon),
        label: label);
  }

  Widget selectedTap() {
    switch (selectedIndex) {
      case 0:
        return const HomeTab();
      case 1:
        return const MapTab();
      case 2:
        return const LoveTab();
      case 3:
        return const ProfileTab();
      default:
        return const Column();
    }
  }
}
