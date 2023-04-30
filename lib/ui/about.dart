import 'package:flutter/material.dart';

import 'package:cracker/constants/constants.dart';

import 'package:cracker/ui/widgets/responsive_ui.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AboutScreen(),
    );
  }
}

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Material(
        child: Container(
      height: _height,
      width: _width,
      padding: EdgeInsets.only(bottom: 1),
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(
            height: _height / 13.4,
          ),
          topButton(),
          Container(
              height: _height,
              width: _width,
              margin: new EdgeInsets.only(left: 7.0, right: 7.0),
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  SizedBox(
                    height: _height / 40,
                  ),
                  welcomeTextRow(),
                  SizedBox(
                    height: _height / 40,
                  ),
                  mainText(),
                  SizedBox(
                    height: _height / 40,
                  ),
                  byText(),
                  SizedBox(
                    height: _height / 40,
                  ),
                  groupText(),
                  SizedBox(
                    height: _height / 40,
                  ),
                  nameText1(),
                  nameText2(),
                  SizedBox(
                    height: _height / 40,
                  ),
                  creditText(),
                  SizedBox(
                    height: _height / 9,
                  ),
                  subjectText(),
                ]),
              )),
        ]),
      ),
    ));
  }

  Widget welcomeTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 1000, right: _width / 1000),
      child: Text(
        "About",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
      ),
    );
  }

  Widget topButton() {
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
              ),
              iconSize: 30,
              color: Colors.blue[500],
              splashColor: Colors.grey,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              width: _width / 2.5,
            ),
            IconButton(
              icon: Icon(
                Icons.home,
              ),
              iconSize: 30,
              color: Colors.blue[500],
              splashColor: Colors.grey,
              onPressed: () async {
                Navigator.of(context).pushNamed(HOME_PAGE);
              },
            ),
            SizedBox(
              width: _width / 39,
            ),
            IconButton(
              icon: Icon(Icons.settings),
              iconSize: 30,
              color: Colors.blue[500],
              splashColor: Colors.grey,
              onPressed: () async {
                Navigator.of(context).pushNamed(SETTINGS);
              },
            ),
          ]),
    );
  }

  Widget mainText() {
    return Container(
        margin: new EdgeInsets.only(left: 20.0, right: 20.0),
        child: Text(
          "The main function of this app is to encrypt and decrypt text using Caesar Cipher method. This app was created to assist students in their learning and instructors can also use it as a learning tool. This application includes a number of features that aid the user.",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        ),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5)));
  }
}

Widget byText() {
  return Container(
    margin: new EdgeInsets.only(left: 7.0, right: 7.0),
    child: Text("By: ",
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
  );
}

Widget groupText() {
  return Container(
    margin: new EdgeInsets.only(left: 7.0, right: 7.0),
    child: Text("Group 1 ",
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
  );
}

Widget nameText1() {
  return Container(
    margin: new EdgeInsets.only(left: 20.0, right: 20.0),
    child: Row(children: <Widget>[
      Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Text('Syazwani'),
      ),
      Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Text('Maisarah'),
      ),
      Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Text('Mustaqim'),
      )
    ]),
  );
}

Widget nameText2() {
  return Container(
    margin: new EdgeInsets.only(left: 20.0, right: 20.0),
    child: Row(children: <Widget>[
      Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Text('Azfar'),
      ),
      Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Text('Hanisah'),
      ),
      Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Text('Ameen'),
      ),
      Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Text('Luqman'),
      )
    ]),
  );
}

Widget creditText() {
  return Container(
      margin: new EdgeInsets.only(left: 7.0, right: 7.0),
      child: Column(children: <Widget>[
        Text("Credit to: ",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
        SizedBox(
          height: 10,
        ),
        Text("Encik Muhammad Fakri Bin Othman ",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
        Text("Human Computer Interaction Lecturer",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
        Text("Universiti Tun Hussein Onn Malaysia",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
      ]));
}

Widget subjectText() {
  return Container(
      margin: new EdgeInsets.only(left: 7.0, right: 7.0),
      child: Column(children: <Widget>[
        Text("Human Computer Interaction Project",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
        Text("Section 1",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
        Text("Semester 3 2021/2022",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
      ]));
}

Widget nameText3() {
  return Container(
      margin: new EdgeInsets.only(left: 7.0, right: 7.0),
      child: Row(children: <Widget>[
        Text("Syazwani",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
        SizedBox(width: 10),
        Text("Maisarah",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
        SizedBox(width: 10),
        Text("Mustaqim",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
      ]));
}

Widget nameText4() {
  return Container(
      margin: new EdgeInsets.only(left: 7.0, right: 7.0),
      child: Row(children: <Widget>[
        Text("Azfar",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
        SizedBox(width: 10),
        Text("Hanisah",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
        SizedBox(width: 10),
        Text("Ameen",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
      ]));
}

Widget nameText5() {
  return Container(
      margin: new EdgeInsets.only(left: 7.0, right: 7.0),
      child: Row(children: <Widget>[
        Text("Luqman",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
      ]));
}
