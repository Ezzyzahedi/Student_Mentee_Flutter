import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_mentee/Source/Family_Screen/welcome_screen.dart';
import 'package:student_mentee/Source/Student_Screens/student_home.dart';

class Wrapper extends StatelessWidget {
  final bool firstTime = true ;
  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context) ;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: firstTime ? WelcomeScreen() : HomePage() 
    );
  }
}