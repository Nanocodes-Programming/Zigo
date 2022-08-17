import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/screens/auth/signIn.dart';
import 'package:zigo/screens/home/zigo_home.dart';
import 'package:zigo/screens/my_budget_lists.dart';
import 'package:zigo/screens/plan_your_budget_screen.dart';
import 'package:zigo/screens/splash/splash_four.dart';
import 'package:zigo/screens/splash/splash_one.dart';
import 'package:zigo/screens/splash/splash_three.dart';
import 'package:zigo/screens/splash/splash_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Zigo',
      theme: ThemeData(
        // fontFamily: 'Montserrat',
        primarySwatch: buildMaterialColor(Color(0xFF0A71DE)),
      ),
      home: PlanYourBudgetScreen(),
    );
  }
}


