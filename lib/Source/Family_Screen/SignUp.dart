import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_mentee/Themes/light_colors.dart';

class SignUp extends StatefulWidget {
  final bool isMentor;

  const SignUp({Key key, this.isMentor}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _collegenumberController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: EdgeInsets.only(
            top: ScreenUtil().setWidth(60.0),
            left: ScreenUtil().setWidth(60.0),
            right: ScreenUtil().setWidth(60.0)),
        child: new ListView(children: <Widget>[
          new Text(
            "Setting up profile",
            style: new TextStyle(
                fontFamily: 'Nunito',
                color: Colors.white,
                letterSpacing: 1.2,
                fontSize: ScreenUtil().setSp(65.0),
                fontWeight: FontWeight.w600),
          ),
          new ProfilePicture(),
          new TextField(
            controller: _emailController,
            style: new TextStyle(
              fontFamily: 'Nunito',
              color: Colors.white,
            ),
            decoration: new InputDecoration(
                icon: Icon(Icons.alternate_email),
                border: new OutlineInputBorder(),
                hintText: "example@xyz.com",
                helperText: "Your email"),
          ),
          new SizedBox(
            height: ScreenUtil().setHeight(30.0),
          ),
          new TextField(
            controller: _collegenumberController,
            keyboardType: TextInputType.number,
            style: new TextStyle(
              fontFamily: 'Nunito',
              color: Colors.white,
            ),
            decoration: new InputDecoration(
                icon: Icon(Icons.keyboard),
                border: new OutlineInputBorder(),
                hintText: widget.isMentor ? "SSID" : "Registration Number",
                helperText:
                    widget.isMentor ? "Your SSID" : "Registration Number"),
          ),
          new SizedBox(
            height: ScreenUtil().setHeight(30.0),
          ),
          new Text(
            "Contact details",
            style: new TextStyle(
                fontFamily: 'Nunito',
                color: Colors.white,
                letterSpacing: 1.2,
                fontSize: ScreenUtil().setSp(50.0),
                fontWeight: FontWeight.w600),
          ),
          new PhoneNumberCollector(phoneController: _phoneController),
          new SizedBox(
            height: ScreenUtil().setHeight(110.0),
          ),
          new Signup_Button(),
          new SizedBox(
            height: ScreenUtil().setHeight(50.0),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Already have an account?",
                style: new TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: ScreenUtil().setSp(50.0),
                  color: LightColor.titleTextColor
                ),
              ),
              new SizedBox(
                width: ScreenUtil().setWidth(40.0),
              ),
              new GestureDetector(
                onTap: (){

                },
                child: new Text(
                  "Login",
                  style: new TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: ScreenUtil().setSp(50.0),
                    fontWeight: FontWeight.w800,
                    color: Colors.white
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}

class Signup_Button extends StatelessWidget {
  const Signup_Button({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: ScreenUtil().setHeight(120.0),
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side: BorderSide(color: Colors.white, width: 1)),
        onPressed: () {
          // Few Backend Stuffs ..
          // Thne go the Homapage after all signup things made .
          //Navigator.push(context, MaterialPageRoute(builder: (context) =>  Check(userName: _controller.text)));
        },
        child: new Text(
          "Sign up",
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

class PhoneNumberCollector extends StatelessWidget {
  const PhoneNumberCollector({
    Key key,
    @required TextEditingController phoneController,
  })  : _phoneController = phoneController,
        super(key: key);

  final TextEditingController _phoneController;

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Expanded(
          flex: 3,
          child: new TextField(
            keyboardType: TextInputType.number,
            cursorColor: Theme.of(context).primaryColor,
            decoration: new InputDecoration(
                prefixIcon: new Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                helperText: 'Country code'),
          ),
        ),
        new SizedBox(
          width: ScreenUtil().setWidth(20.0),
        ),
        new Expanded(
            flex: 7,
            child: new TextField(
              controller: _phoneController,
              keyboardType: TextInputType.number,
              cursorColor: Theme.of(context).primaryColor,
              decoration: new InputDecoration(helperText: 'Phone number'),
            )),
      ],
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: MediaQuery.of(context).size.height * 0.33,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new ClipRRect(
            borderRadius: new BorderRadius.circular(100),
            child: Container(
              color: Colors.amber,
              width: ScreenUtil().setWidth(500),
              height: ScreenUtil().setWidth(500),
            ),
          ),
          new SizedBox(
            height: ScreenUtil().setHeight(30.0),
          ),
          new RaisedButton(
            onPressed: () {},
            color: Theme.of(context).primaryColor,
            shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: new BorderSide(
                  color: Colors.white,
                )),
            child: new Text(
              "ADD PHOTO",
              style: new TextStyle(fontFamily: 'Nunito', color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
