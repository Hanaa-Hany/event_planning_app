import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_app/auth/login_screen.dart';
import 'package:event_planning_app/auth/register_screen.dart';
import 'package:event_planning_app/home/home_screen.dart';
import 'package:event_planning_app/home/tabs/home_tab/add_event/add_event.dart';
import 'package:event_planning_app/providers/event_provider.dart';
import 'package:event_planning_app/providers/language_provider.dart';
import 'package:event_planning_app/providers/theme_provider.dart';
import 'package:event_planning_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  //changeNotifierProvider => u cant used this way if u have multiProvider
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create:
        (context)=>LanguageProvider()),
        ChangeNotifierProvider(create:
            (context)=>ThemeProvider()),
        ChangeNotifierProvider(create:
            (context)=>EventProvider()),
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
        LoginScreen.routeName: (context) =>   LoginScreen(),
        RegisterScreen.routeName: (context) =>   RegisterScreen(),
        AddEvent.routeName: (context) =>   AddEvent(),
      },
    );
  }
}
