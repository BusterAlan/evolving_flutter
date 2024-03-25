import 'package:evolving_flutter/pages/home_page.dart';
import 'package:evolving_flutter/providers/local_notifications.dart';
import 'package:evolving_flutter/providers/shared_pref.dart';
import 'package:evolving_flutter/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest_all.dart' as tz;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  
  final prefs = UserPrefs();
  await prefs.initPrefs();

  final notifs = LocalNotifications();
  await notifs.initialize();

  runApp(

    MultiProvider(
      
      providers: [

        ChangeNotifierProvider(create: (_) => UIProvider())

      ],

      child: const MainApp()
      
    )
    
  );

}

class MainApp extends StatelessWidget {

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Udemy Experience Flutter',
      localizationsDelegates: const [

        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate

      ],

      supportedLocales: const [

        Locale('en'),
        Locale('es')

      ],

      theme: ThemeData.dark().copyWith(

        appBarTheme: AppBarTheme(

          backgroundColor: Colors.grey[900],

        ),

        bottomNavigationBarTheme: const BottomNavigationBarThemeData(

          selectedItemColor: Colors.green,

        ),

        colorScheme: const ColorScheme.dark(
          
          primary: Colors.green
          
        ),

        scaffoldBackgroundColor: Colors.grey[900],
        primaryColorDark: Colors.grey[850],
        listTileTheme: const ListTileThemeData(

          titleTextStyle: TextStyle(

            fontWeight: FontWeight.bold,
            fontSize: 16

          ),

          subtitleTextStyle: TextStyle(

            fontWeight: FontWeight.w300,
            fontSize: 16

          )

        )

      ),

      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {

        'home'        : (_) => const HomePage()

      },

    );

  }

}

