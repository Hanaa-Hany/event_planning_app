import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:event_planning_app/utils/assets_manager.dart';
import 'package:flutter/cupertino.dart';

class TabItemWidget extends StatelessWidget {
  TabItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: width * .04, vertical: height * .01),
      height: height * .2599,
      // padding: EdgeInsets.symmetric(vertical: height*.02),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsManager.birthdayBgLight),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.babyBlueColor,
              borderRadius: BorderRadius.circular(8)
            ),
              child: Column(
            children: [
              Text(
                "21",
                style: AppStyle.bold20primary,
              ),
              Text(
                "Nov",
                style: AppStyle.bold14primary,
              ),
            ],
          )),
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: AppColors.babyBlueColor,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "this is the birthday party",
                  style: AppStyle.bold14black,
                ),
                Icon(
                  CupertinoIcons.heart_fill,
                  color: AppColors.primaryColor,
                  size: 24,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
