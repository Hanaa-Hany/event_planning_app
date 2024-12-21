import 'package:event_planning_app/providers/language_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../utils/app_styles.dart';

class DropdownMenuItemsWidget extends StatefulWidget{
  final String item1;
  final String item2;

  DropdownMenuItemsWidget(this.item1, this.item2);

  @override
  State<DropdownMenuItemsWidget> createState() => _DropdownMenuItemsWidgetState();
}

class _DropdownMenuItemsWidgetState extends State<DropdownMenuItemsWidget> {
  String? _selectedValue ;


  @override
  void initState() {
    super.initState();
    _selectedValue = widget.item1;
  }

  @override
  Widget build(BuildContext context) {
    var language=Provider.of<LanguageProvider>(context);

    return DropdownButtonFormField<String>(
      value: _selectedValue,

      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
            BorderSide(color: AppColors.primaryColor, width: 1)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
            BorderSide(color: AppColors.primaryColor, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
            BorderSide(color: AppColors.primaryColor, width: 1)),
      ),
      items: <String>[
        widget.item1,
        widget.item2
      ].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {

        setState(() {
          _selectedValue = value;

          _selectedValue==widget.item1?language.changeLanguage("en"):language.changeLanguage("ar");
        });
      },
      selectedItemBuilder: (BuildContext context) {
        return <String>[
          widget.item1,
          widget.item2
        ].map((String value) {
          print(value);
          return Text(
            value == widget.item1
                ? AppLocalizations.of(context)!.english
                : AppLocalizations.of(context)!.arabic,
            style:AppStyle.bold20primary,
          );
        }).toList();
      },
      icon: Icon(Icons.arrow_drop_down,size: 35,color: AppColors.primaryColor,),
    );
  }
}