import 'package:krishna_design/screens/dashboard/dashboard_screen.dart';
import 'package:krishna_design/screens/home_page/home_screen.dart';
import 'package:krishna_design/screens/login_page/log_in_screen.dart';
import 'package:krishna_design/screens/registration_page/registration_screen.dart';
import 'package:krishna_design/screens/subcategory_page/subcategory_screen.dart';

import '../main.dart';
import 'package:flutter/material.dart';

const String rootScreen = "/";
const String loginScreen = "LogInScreen";
const String registrationScreen = "RegistrationScreen";
const String dashboard = "Dashboard";
const String homeScreen = "HomeScreen";
const String subcategoryScreen = "SubcategoryScreen";

Map<String, WidgetBuilder> routes = {
  rootScreen: (context) => const MyApp(),
  loginScreen: (context) => const LogInScreen(),
  registrationScreen: (context) => const RegistrationScreen(),
  dashboard: (context) => const Dashboard(),
  homeScreen: (context) => const HomeScreen(),
  subcategoryScreen: (context) => const SubcategoryScreen(),
};
