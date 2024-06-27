import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init()
  ]).then((value) {
    runApp(MyApp());
  });
  await initializePreferences();
}
String apiUrl='http://192.168.1.7:8000';
String? selectedOption;
bool isLoggedIn = false;
String? userName;
String? userId;
String? userEmail;
String? userAvatar;
String? userPhone;
String? userTrack;
bool? isTechSelected=false;

Future<void> initializePreferences() async {
  final prefs = await SharedPreferences.getInstance();
  isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  userEmail = prefs.getString('userEmail');
  userName = prefs.getString('userName');
  selectedOption = prefs.getString('selectedOption');
  userAvatar = prefs.getString('userAvatar');
  userPhone = prefs.getString('userPhone');
  userId = prefs.getString('userId');
  userTrack = prefs.getString('userTrack');
  isTechSelected = prefs.getBool('isTechSelected');
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
          child: Consumer<ThemeProvider>(
            builder: (context, provider, child) {
              return MaterialApp(
                theme: theme,
                title: 'careeria',
                navigatorKey: NavigatorService.navigatorKey,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: [
                  AppLocalizationDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [
                  Locale(
                    'en',
                    '',
                  ),
                ],
                initialRoute:isLoggedIn?AppRoutes.androidLargeTwentythreeContainerScreen: AppRoutes.loginScreen,
                routes: AppRoutes.routes,
              );
            },
          ),
        );
      },
    );
  }
}
