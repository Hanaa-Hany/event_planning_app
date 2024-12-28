import 'package:event_planning_app/auth/login_screen.dart';
import 'package:event_planning_app/auth/register_screen.dart';
import 'package:event_planning_app/home/home_screen.dart';
import 'package:event_planning_app/providers/language_provider.dart';
import 'package:event_planning_app/providers/theme_provider.dart';
import 'package:event_planning_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  //changeNotifierProvider => u cant used this way if u have multiProvider
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create:
        (context)=>LanguageProvider()),
        ChangeNotifierProvider(create:
            (context)=>ThemeProvider()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var language=Provider.of<LanguageProvider>(context);
    var theme=Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: theme.themeModeApp,
      initialRoute: LoginScreen.routeName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      //select which language the app will use
      locale: Locale(language.appLanguage),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        LoginScreen.routeName: (context) =>  LoginScreen(),
        RegisterScreen.routeName: (context) =>  RegisterScreen(),
      },
    );
  }
}
