import 'package:event_planning_app/home/home_screen.dart';
import 'package:event_planning_app/providers/language_provider.dart';
import 'package:event_planning_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) =>
        LanguageProvider()
      ,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var language=Provider.of<LanguageProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: HomeScreen.routeName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      //select which language the app will use
      locale: Locale(language.appLanguage),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
