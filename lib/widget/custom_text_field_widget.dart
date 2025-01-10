import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {

  String hintText;
  String? prefixIcon;
  TextStyle? hintStyle;
  Color? borderColor;
  int? maxLines;
  bool? obscureText;
  TextInputType? keyboardType;
  TextEditingController controller;
  String? Function(String?)? validator;
  CustomTextFieldWidget({super.key,required this.hintText, this.prefixIcon, this.hintStyle
    ,this.borderColor,this.maxLines,required this.controller, this.validator,
  this.keyboardType, this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType??TextInputType.text,
      obscureText: obscureText?? false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color:borderColor?? AppColors.grayColor,width: 1),
        ),
        hintText: hintText,
        hintStyle: hintStyle??AppStyle.medium16gray,
        prefixIcon: prefixIcon != null?Image.asset(prefixIcon!):null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color:borderColor?? AppColors.grayColor,width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color:borderColor?? AppColors.redColor,width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color:borderColor?? AppColors.grayColor,width: 1),
        ),
      ),
      maxLines:maxLines??1 ,
      controller: controller,
      validator: validator,
    );
  }
}
