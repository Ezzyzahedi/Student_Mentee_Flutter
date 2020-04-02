import 'package:flutter/material.dart';
import 'package:student_mentee/Source/splash_screen.dart';
import 'package:student_mentee/Themes/light_colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Mentee App',
      theme: ThemeData(
        backgroundColor: LightColor.purple,
        primaryColor: LightColor.background,
      ),
      home: SplashScreen(),
    );
  }
}
