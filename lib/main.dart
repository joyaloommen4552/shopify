import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopify/CustomClass/screen_config.dart';
import 'package:shopify/Screens/splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      ScreenConfig.init(context);

      return MaterialApp(
        theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      );
    });
  }
}
