import 'package:event_planning_app/home/tabs/home_tab/tab_item_widget.dart';
import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:event_planning_app/utils/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../widget/custom_text_field_widget.dart';

class LoveTab extends StatefulWidget {
  const LoveTab({super.key});

  @override
  State<LoveTab> createState() => _LoveTabState();
}

class _LoveTabState extends State<LoveTab> {
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.babyBlueColor,
      ),
      body:
      Column(
        children: [
          Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .04),
            child: CustomTextFieldWidget(hintText:AppLocalizations.of(context)!.search_for_event
              ,prefixIcon: AssetsManager.searchIcon
              ,hintStyle: AppStyle.bold14primary,
            borderColor: AppColors.primaryColor,
            controller: searchController,),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Container();
                //TabItemWidget();

            },
            itemCount: 20,),
          )
        ],
      ),
    );
  }
}
