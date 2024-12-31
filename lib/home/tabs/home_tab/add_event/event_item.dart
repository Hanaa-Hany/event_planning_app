import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/assets_manager.dart';
import 'package:flutter/cupertino.dart';

class EventItem extends StatelessWidget {
  String eventName;
  String eventIcon;
   EventItem({super.key,required this.eventName,required this.eventIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

      ),
      child:Row(
        children: [
          ImageIcon(AssetImage(eventIcon)),
          Text(eventName)
        ],
      ),
    );
  }
}
