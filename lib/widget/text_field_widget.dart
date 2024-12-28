import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {

  String hintText;
  String prefixIcon;
  TextStyle? hintStyle;
  Color? borderColor;
  TextFieldWidget({super.key,required this.hintText,required this.prefixIcon, this.hintStyle,this.borderColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color:borderColor?? AppColors.grayColor,width: 1),
        ),
        hintText: hintText,
        hintStyle: hintStyle??AppStyle.medium16gray,
        prefixIcon:Image.asset(prefixIcon),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color:borderColor?? AppColors.grayColor,width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color:borderColor?? AppColors.grayColor,width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color:borderColor?? AppColors.grayColor,width: 1),
        )
      ),
    );
  }
}
