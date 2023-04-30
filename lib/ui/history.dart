import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cracker/constants/constants.dart';
import 'package:cracker/ui/widgets/responsive_ui.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HistoryScreen(),
    );
  }
}

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController _wordController = TextEditingController();
  TextEditingController _keyController = TextEditingController();
  String _result = "";

  @override
  void dispose() {
    _wordController.dispose();
    _keyController.dispose();
    super.dispose();
  }

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
                SizedBox(
                  height: _height / 40,
                ),
                welcomeTextRow(),
                SizedBox(
                  height: _height / 40,
                ),
                Divider(height: 20, thickness: 1),
                history1Row(),
                Divider(height: 20, thickness: 1),
                history2Row(),
                Divider(height: 20, thickness: 1),
                history3Row(),
                Divider(height: 20, thickness: 1),
              ]),
            )));
  }

  Widget welcomeTextRow() {
    return Container(
      margin: EdgeInsets.only(left: 60),
      child: Row(
        children: <Widget>[
          Text(
            "History",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
          SizedBox(width: 60),
          RaisedButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content:
                          Column(mainAxisSize: MainAxisSize.min, children: [
                        Row(
                          children: <Widget>[
                            Column(children: <Widget>[
                              Text('Deleted!'),
                            ]),
                          ],
                        )
                      ]),
                      actions: [
                        TextButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              textColor: Colors.white,
              padding: EdgeInsets.all(0.0),
              child: Container(
                alignment: Alignment.center,
                width:
                    _large ? _width / 4 : (_medium ? _width / 4 : _width / 3.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  gradient: LinearGradient(
                    colors: [Colors.red[900], Colors.red[900]],
                  ),
                ),
                padding: const EdgeInsets.all(12.0),
                child: Text('CLEAR ALL', style: TextStyle(fontSize: 14)),
              )),
        ],
      ),
    );
  }

  Widget history1Row() {
    return Container(
        margin: new EdgeInsets.only(left: 40.0, right: 40.0),
        child: Column(children: <Widget>[
          Text(
              "Sunday 19/12/2021                                                      ",
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
          SizedBox(height: 10),
          Text(
              "Input : Attack the ship at twelve                                                                            ",
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
          SizedBox(height: 10),
          Text(
              "Encrypted : Dwwdfn wkh vkls dw wzhoyh                                                                   ",
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
          SizedBox(height: 10),
          Text(
              "Key :  3                                                                            ",
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
          SizedBox(height: 10),
        ]));
  }

  Widget history2Row() {
    return Container(
        margin: new EdgeInsets.only(left: 40.0, right: 40.0),
        child: Column(children: <Widget>[
          Text(
              "Wednesday 8/12/2021                                                      ",
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
          SizedBox(height: 10),
          Text(
              "Input : Yesterday is past                                                                           ",
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
          SizedBox(height: 10),
          Text(
              "Encrypted : Msghsfrom wg dogh                                                                  ",
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
          SizedBox(height: 10),
          Text(
              "Key :  14                                                                            ",
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
          SizedBox(height: 10),
        ]));
  }

  Widget history3Row() {
    return Container(
        margin: new EdgeInsets.only(left: 40.0, right: 40.0),
        child: Column(children: <Widget>[
          Text(
              "Monday 29/11/2021                                                      ",
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
          SizedBox(height: 10),
          Text(
              "Input : Nasgt Iusvazkx Otzkxgizout                                                                           ",
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
          SizedBox(height: 10),
          Text(
              "Decrypted : Human Computer Interaction                                                                  ",
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
          SizedBox(height: 10),
          Text(
              "Key :  6                                                                            ",
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
          SizedBox(height: 10),
        ]));
  }

  Widget topButton() {
    return Container(
      margin: EdgeInsets.only(left: _width / 1000, right: _width / 1000),
      child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
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
}
