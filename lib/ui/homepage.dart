import 'package:cracker/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cracker/constants/constants.dart';
import 'package:cracker/ui/widgets/responsive_ui.dart';
import 'package:flutter/widgets.dart';

class HomePagePage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageScreen(),
    );
  }
}

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();

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
        padding: EdgeInsets.only(bottom: 5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              settingsbutton(),
              SizedBox(height: _height / 10),
              welcomeTextRow(),
              button(),
              SizedBox(height: _height / 20),
              button2(),
              SizedBox(height: _height / 5),
              aboutTextRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget settingsbutton() {
    return Container(
      padding: EdgeInsets.only(left: _width / 1.4, top: _height / 13.0),
      child: Container(
        alignment: Alignment.center,
        child: IconButton(
          icon: Icon(
            Icons.settings,
          ),
          iconSize: 30,
          color: Colors.blue[500],
          splashColor: Colors.grey,
          onPressed: () {
            Navigator.of(context).pushNamed(SETTINGS);
          },
        ),
      ),
    );
  }

  Widget welcomeTextRow() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 50.0),
      child: Column(
        children: <Widget>[
          Container(
            child: Image.asset(
              'assets/images/logotext.png',
              height: 90,
              width: 400,
              fit: BoxFit.contain,
            ),
          ),
          Container(
              alignment: Alignment.center,
              child: Text(
                'Caesar Cipher Decoder',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0),
              )),
          SizedBox(height: 100)
        ],
      ),
    );
  }

  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        Navigator.of(context).pushNamed(ENCRYPT_DECRYPT);
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: _medium ? _width / 1.5 : _width / 1.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.blue[500], Colors.blue[500]],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'ENCRYPT DECRYPT',
          style: TextStyle(fontSize: 21),
        ),
      ),
    );
  }

  Widget button2() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        Navigator.of(context).pushNamed(CAESAR_WHEEL);
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: _medium ? _width / 1.5 : _width / 1.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.blue[500], Colors.blue[500]],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'CAESAR WHEEL',
          style: TextStyle(fontSize: 21),
        ),
      ),
    );
  }

  Widget aboutTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 1000, top: _height / 120.0),
      child: new ButtonBar(
        mainAxisSize: MainAxisSize
            .min, // this will take space as minimum as posible(to center)
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ABOUT);
            },
            child: Text(
              "About",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[500],
                  fontSize: 21),
            ),
          ),
          Text(
            "                       ",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(HOW_TO_USE);
            },
            child: Text(
              "How to Use",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[500],
                  fontSize: 21),
            ),
          )
        ],
      ),
    );
  }
}
