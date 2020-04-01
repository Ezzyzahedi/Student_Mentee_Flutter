import 'dart:async';

import 'package:flutter/material.dart';
import 'package:student_mentee/Source/wrapper.dart';
import 'package:student_mentee/Themes/light_colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer( Duration(seconds:  3), () {
      Navigator.pop(context) ;
      Navigator.push(context, MaterialPageRoute(builder: (context) => Wrapper()));
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
       child: new Column(
         mainAxisAlignment: MainAxisAlignment.center,
         mainAxisSize: MainAxisSize.min,
         children: <Widget>[
           new Image(
             width: MediaQuery.of(context).size.width * 0.33,
             height:  MediaQuery.of(context).size.width * 0.33,
             image: AssetImage('assets/images/cvrce_logo.png')
          ),
          new SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          new CircularProgressIndicator(),
         ],
       ),
      ),
    );
  }
}