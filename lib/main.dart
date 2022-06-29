import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:krishna_design/utils/screen_utils.dart';

import 'networks/app_preference.dart';
import 'networks/db_constants.dart';
import 'screens/login_page/log_in_screen.dart';
import 'utils/navigator_route.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // await NotificationService().flutterLocalNotificationsPlugin.cancelAll();

  // await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      routes: routes,
      initialRoute: rootScreen,
      // home: DashBoardScreen(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool login = false;

  Future getUser() async {
    await AppPreference.inti();
    login = (AppPreference.prefs != null)
        ? AppPreference.prefs!.getBool(dbLogin) ?? false
        : false;
    setState(() {});
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Screen.setScreenSize(context);
    return login ? const LogInScreen() : const LogInScreen();
  }
}
