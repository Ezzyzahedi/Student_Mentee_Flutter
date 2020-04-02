import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_mentee/Source/Family_Screen/student_mentee_check.dart';
import 'package:student_mentee/Themes/light_colors.dart';

class WelcomeScreen extends StatelessWidget {
  final  TextEditingController _controller  = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(60.0)),
        child: new ListView(
          children: <Widget>[
            new SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            new Text(
              "Hi !",
              style: new TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.white,
                  letterSpacing: 1.2,
                  fontSize: ScreenUtil().setSp(90.0),
                  fontWeight: FontWeight.w800),
            ),
            new SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            new Text(
              "Nice to meet you! What do your friends call you?",
              style: new TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.white,
                  letterSpacing: 1.2,
                  fontSize: ScreenUtil().setSp(65.0),
                  fontWeight: FontWeight.w600),
            ),
            new SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            new TextField(
              controller: _controller,
              cursorColor: Colors.white,
              style: new TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(65.0),
                  fontWeight: FontWeight.w200),
              decoration: new InputDecoration(
                  hintText: "They call me ...", helperText: 'Nickname'),
            ),
            new SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            new Container(
              height: ScreenUtil().setHeight(120.0),
              child: RaisedButton(
                color: Theme.of(context).backgroundColor,
                shape: new RoundedRectangleBorder(
                  borderRadius:  BorderRadius.circular(50.0),
                  side: BorderSide(
                    color: Colors.white,
                    width: 1
                  )
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  Check(userName: _controller.text)));
                },
                child: new Text(
                  "Continue",
                  style: new TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(65.0),
                      fontWeight: FontWeight.w200),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
