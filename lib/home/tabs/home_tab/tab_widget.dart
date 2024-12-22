import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  String eventName;
  bool isSelected;
   TabWidget({super.key,required this.eventName,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;

    return  Container(
      padding: EdgeInsets.all(width*.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width*.15),
            color:isSelected==true?AppColors.babyBlueColor: Colors.transparent ,
        border: Border.all(width: 1,color: AppColors.babyBlueColor)

      ),
      child: Text(eventName,style:
      isSelected==true?
      AppStyle.medium14primary:
        AppStyle.medium14baby,),
    );
  }
}
