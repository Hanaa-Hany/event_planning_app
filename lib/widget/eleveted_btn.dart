import 'package:event_planning_app/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class ElevetedBtn extends StatelessWidget {
  String text;
  TextStyle? textStyle;
  Color? backgroundColor;
  OutlinedBorder? borderStyle;
  final VoidCallback? onPressed;

  ElevetedBtn(
      {super.key,
      required this.text,
      this.textStyle,
      this.backgroundColor,
      this.borderStyle,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:
        //logout logic
        onPressed

       // Navigator.of(context).pushNamed(HomeScreen.routeName);
      ,
      child: Text(
        text,
        style: textStyle ?? AppStyle.medium20white,
      ),
      style: ButtonStyle(
        backgroundColor:
            WidgetStatePropertyAll(backgroundColor ?? AppColors.primaryColor),
        padding: WidgetStatePropertyAll(EdgeInsets.all(10)),
        shape: WidgetStatePropertyAll(borderStyle ??
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
