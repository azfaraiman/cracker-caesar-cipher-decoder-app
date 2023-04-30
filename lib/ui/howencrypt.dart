import 'package:flutter/material.dart';
import 'package:cracker/constants/constants.dart';
import 'package:cracker/ui/widgets/responsive_ui.dart';

class HowEncryptPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HowEncryptScreen(),
    );
  }
}

class HowEncryptScreen extends StatefulWidget {
  @override
  _HowEncryptScreenState createState() => _HowEncryptScreenState();
}

class _HowEncryptScreenState extends State<HowEncryptScreen> {
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
                  subText(),
                  SizedBox(
                    height: _height / 40,
                  ),
                  clipShape(),
                  SizedBox(
                    height: _height / 40,
                  ),
                  creditText(),
                  SizedBox(
                    height: _height / 5,
                  ),
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
        "How To Use",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
      ),
    );
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

  Widget subText() {
    return Container(
      margin: EdgeInsets.only(left: _width / 1000, right: _width / 1000),
      child: Text("ENCRYPT DECRYPT",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
    );
  }

  Widget clipShape() {
    //double height = MediaQuery.of(context).size.height;
    return Stack(children: <Widget>[
      Opacity(
        opacity: 1,
        child: ClipPath(
            child: Container(
                child: Column(children: <Widget>[
          Container(
            height: 400,
            child: Image(
              image: AssetImage("assets/images/sslight.png"),
              fit: BoxFit.contain,
            ),
          ),
        ]))),
      )
    ]);
  }

  Widget creditText() {
    return Container(
        margin: new EdgeInsets.only(left: 40.0, right: 40.0),
        child: Column(children: <Widget>[
          Text("1. Enter your code to be encrypted in the textbox.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
          SizedBox(height: 10),
          Text(
              "2. Then, enter key (1-25) in the textbox.                       ",
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
          SizedBox(height: 10),
          Text("3. Push button 'ENCRYPT' or 'DECRYPT'.               ",
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
          SizedBox(height: 10),
          Text(
              "*'ENCRYPT' button convert original code into an encrypted code form.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.blue[500],
                  fontSize: 14)),
          SizedBox(height: 10),
          Text(
              "*'DECRYPT' button convert encrypted code into an priginal code form.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.blue[500],
                  fontSize: 14)),
          SizedBox(height: 10),
          Text("4. Output code will be present in the box.              ",
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
          SizedBox(height: 10),
          Text(
              "5. Push button 'RESET' to clear all input, key and output code.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
          SizedBox(height: 10),
          Text("6. Optional button for copy and paste the code.    ",
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
          SizedBox(height: 50),
        ]));
  }
}
