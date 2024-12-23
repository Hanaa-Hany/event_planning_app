import 'package:event_planning_app/home/tabs/home_tab/tab_item_widget.dart';
import 'package:event_planning_app/home/widget/text_field_widget.dart';
import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:event_planning_app/utils/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoveTab extends StatelessWidget {
  const LoveTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.babyBlueColor,
      ),
      body:
      Column(
        children: [
          TextFieldWidget(hintText:AppLocalizations.of(context)!.search_for_event
            ,prefixIcon: AssetsManager.searchIcon
            ,hintStyle: AppStyle.bold14primary,
          borderColor: AppColors.primaryColor,),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return TabItemWidget();
            
            },
            itemCount: 20,),
          )
        ],
      ),
    );
  }
}
