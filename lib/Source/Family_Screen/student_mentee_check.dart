import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_mentee/Source/Family_Screen/SignUp.dart';

class Check extends StatelessWidget {
  String userName;
  Check({@required this.userName});

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
              "Hi , $userName",
              style: new TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.white,
                  letterSpacing: 1.2,
                  fontSize: ScreenUtil().setSp(90.0),
                  fontWeight: FontWeight.w800),
            ),
            new SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            new Text(
              "We need to know that you are ",
              style: new TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.white,
                  letterSpacing: 1.2,
                  fontSize: ScreenUtil().setSp(65.0),
                  fontWeight: FontWeight.w600),
            ),
            new SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            new SelectionButton(text: "Student", isMentor: false,),
            new SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            new SelectionButton(text: "Mentor", isMentor: true,)
          ],
        ),
      ),
    );
  }
}

class SelectionButton extends StatelessWidget {
  String text ;
  bool isMentor ;
  SelectionButton({@required this.text , @required this.isMentor}) ;

  @override
  Widget build(BuildContext context) {
    return new Container(
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
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  SignUp(isMentor: isMentor,)));
        },
        child: new Text(
          text,
          style: new TextStyle(
              fontFamily: 'Nunito',
              color: Colors.white,
              fontSize: ScreenUtil().setSp(65.0),
              fontWeight: FontWeight.w200),
        ),
      ),
    );
  }
}

