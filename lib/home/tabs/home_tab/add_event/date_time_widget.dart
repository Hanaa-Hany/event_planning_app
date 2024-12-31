import 'package:event_planning_app/utils/app_styles.dart';
import 'package:event_planning_app/utils/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateTimeWidget extends StatelessWidget {
  String icon;
  String title;
  String btnName;
  void Function()?  pressed;
   DateTimeWidget({super.key,required this.icon,required this.title,required this.btnName,required this.pressed});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;

    return Row(
    children: [
      ImageIcon(AssetImage(icon)),
      SizedBox(width: width*.02,),
      Text(title,style: AppStyle.medium16black,),
      Spacer(),
      TextButton(onPressed:pressed ,
        child: Text(btnName),
        style: ButtonStyle(textStyle: WidgetStateProperty.all(AppStyle.medium16primary),
      ),
      ),
    ],
    );
  }
}
