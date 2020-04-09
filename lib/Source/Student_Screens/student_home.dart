import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_mentee/Source/Family_Screen/SignUp.dart';

class StudentHomePage extends StatefulWidget {
  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  DateTime _selectedDate = new DateTime.now();
  final TextEditingController _language = new TextEditingController();
  final TextEditingController _hobbies = new TextEditingController();

  final TextEditingController _about = new TextEditingController();

  final TextEditingController _expertise = new TextEditingController();
  final TextEditingController _parentPhoneNumber = new TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setWidth(25.0),
                left: ScreenUtil().setWidth(25.0),
                right: ScreenUtil().setWidth(25.0)),
            child: new ListView(
              children: <Widget>[
                new Text(
                  "Fill up the Mentor-Mentee Form",
                  style: new TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      letterSpacing: 1.2,
                      fontSize: ScreenUtil().setSp(75.0),
                      fontWeight: FontWeight.w600),
                ),
                new SizedBox(
                  height: 50.0,
                ),
                date_of_birth(context),
                new SizedBox(
                  height: 20,
                ),
                FillUpColumn(
                  title: "Language Proficiences",
                  hintText: "Hindi , English , Spanish ...",
                  icon: Icons.language,
                  controller: _language,
                ),
                new SizedBox(
                  height: 20,
                ),
                FillUpColumn(
                  title: "Your Hobbies and Interests",
                  hintText: "Visual Arts , Circket , Music ",
                  icon: Icons.beach_access,
                  controller: _hobbies,
                ),
                new SizedBox(
                  height: 20,
                ),
                FillUpColumn(
                  title: "What best Describes you",
                  hintText: "Outgoing , Funny , Lively",
                  icon: Icons.sentiment_satisfied,
                  controller: _about,
                ),
                new SizedBox(
                  height: 20,
                ),
                FillUpColumn(
                  title: "Professional Interest or Expertise",
                  hintText: "Consulatancy , Business and Dev , Science",
                  icon: Icons.person,
                  controller: _expertise,
                ),
                new SizedBox(
                  height: 20,
                ),
                new Text(
                  "Parent contact details",
                  style: new TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      letterSpacing: 1.2,
                      fontSize: ScreenUtil().setSp(50.0),
                      fontWeight: FontWeight.w600),
                ),
                new PhoneNumberCollector(phoneController: _parentPhoneNumber),
                new SizedBox(
                  height: 20,
                ),
                AddressColumn(),
                new SizedBox(
                  height: 30,
                ),
                new Container(
                  height: ScreenUtil().setHeight(120.0),
                  child: RaisedButton(
                    color: Theme.of(context).backgroundColor,
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.white, width: 1)),
                    onPressed: () {
                      Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("Details are Saved !🙋" ,style: new TextStyle(
                        fontFamily: "Nunito",
                        color: Colors.white
                      ), )));
                    },
                    child: new Text(
                      "SAVE DETAILS",
                      style: new TextStyle(
                          fontFamily: 'Nunito',
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(65.0),
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                ),
                new SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ));
  }

  Column date_of_birth(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: new Text(
            "Date of Birth",
            style: new TextStyle(
                fontFamily: 'Nunito',
                color: Colors.white,
                letterSpacing: 1.2,
                fontSize: ScreenUtil().setSp(50.0),
                fontWeight: FontWeight.w600),
          ),
        ),
        new SizedBox(height: 10),
        new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Text(
                "${_selectedDate.toLocal()}".split(' ')[0],
                style: new TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white,
                    letterSpacing: 1.2,
                    fontSize: ScreenUtil().setSp(75.0),
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: () => _selectDate(context),
              color: Theme.of(context).backgroundColor,
              shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  side: BorderSide(color: Colors.white, width: 1)),
              child: new Text(
                "Select date",
                style: new TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(35.0),
                    fontWeight: FontWeight.w200),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AddressColumn extends StatelessWidget {
  const AddressColumn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: new Text(
            "Address",
            style: new TextStyle(
                fontFamily: 'Nunito',
                color: Colors.white,
                letterSpacing: 1.2,
                fontSize: ScreenUtil().setSp(50.0),
                fontWeight: FontWeight.w600),
          ),
        ),
        new SizedBox(
          height: 12.0,
        ),
        new Container(
          height: ScreenUtil().setHeight(250.0),
          decoration: new BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.4),
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(5.0)),
          child: new TextField(
            maxLength: 100,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            style: new TextStyle(
                color: Colors.white,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w700,
                fontSize: ScreenUtil().setSp(43.0)),
            decoration: new InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}

class FillUpColumn extends StatelessWidget {
  final String title;
  final String hintText;
  final IconData icon;

  final TextEditingController controller;

  const FillUpColumn(
      {Key key, this.title, this.hintText, this.icon, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Align(
          alignment: Alignment.topLeft,
          child: new Text(
            this.title,
            style: new TextStyle(
                fontFamily: 'Nunito',
                color: Colors.white,
                letterSpacing: 1.2,
                fontSize: ScreenUtil().setSp(50.0),
                fontWeight: FontWeight.w600),
          ),
        ),
        new SizedBox(height: 10.0),
        new Container(
          decoration: new BoxDecoration(
              border: new Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(5.0)),
          child: new TextField(
            controller: this.controller,
            cursorColor: Theme.of(context).primaryColor,
            style: new TextStyle(color: Colors.white, fontFamily: 'Nunito'),
            decoration: new InputDecoration(
              border: InputBorder.none,
              hintText: this.hintText,
              prefixIcon: new Icon(
                this.icon,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
