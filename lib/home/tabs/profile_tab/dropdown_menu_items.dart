import 'package:event_planning_app/providers/language_provider.dart';
import 'package:event_planning_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';

enum DropdownType { language, theme }

class DropdownMenuItemsWidget extends StatefulWidget {
  final String item1;
  final String item2;
  final DropdownType type;

  const DropdownMenuItemsWidget(this.item1, this.item2, this.type, {super.key});

  @override
  State<DropdownMenuItemsWidget> createState() =>
      _DropdownMenuItemsWidgetState();
}

class _DropdownMenuItemsWidgetState extends State<DropdownMenuItemsWidget> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.item1;
  }

  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LanguageProvider>(context);
    var theme = Provider.of<ThemeProvider>(context);
    return DropdownButtonFormField<String>(
      value: _selectedValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.primaryColor, width: 1)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.primaryColor, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.primaryColor, width: 1)),
      ),
      items: <String>[widget.item1, widget.item2].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedValue = value;
          if (widget.type == DropdownType.language) {
            if (_selectedValue == widget.item1) {
              language.changeLanguage("en");
            } else {
              language.changeLanguage("ar");
            }
          } else if (widget.type == DropdownType.theme) {
            if (_selectedValue == widget.item1) {
              theme.changeTheme(ThemeMode.light);
            } else {
              theme.changeTheme(ThemeMode.dark);
            }
          }
        });
      },
      selectedItemBuilder: (BuildContext context) {
        return <String>[widget.item1, widget.item2].map((String value) {
          return Text(
            widget.type == DropdownType.language
                ? (value == widget.item1
                ? AppLocalizations.of(context)!.english
                : AppLocalizations.of(context)!.arabic)
                : (value == widget.item1
                ? AppLocalizations.of(context)!.light
                : AppLocalizations.of(context)!.dark),
            style: AppStyle.bold20primary,
          );
        }).toList();
      },
      icon: const Icon(
        Icons.arrow_drop_down,
        size: 35,
        color: AppColors.primaryColor,
      ),
    );
  }
}
