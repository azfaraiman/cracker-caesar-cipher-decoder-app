import 'dart:async';
import 'dart:math';
import 'package:cracker/ui/widgets/responsive_ui.dart';
import 'package:cracker/ui/widgets/sharetext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';
import 'package:cracker/constants/constants.dart';
import 'package:share/share.dart';

class CaesarWheelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CaesarWheelScreen(),
    );
  }
}

class CaesarWheelScreen extends StatefulWidget {
  @override
  _CaesarWheelScreenState createState() => _CaesarWheelScreenState();
}

class _CaesarWheelScreenState extends State<CaesarWheelScreen> {
  List<ShareText> sharetexts = [
    ShareText(
      name: '',
      description: '',
    ),
  ];
  void share(BuildContext context, ShareText shareText) {
    final RenderBox box = context.findRenderObject();
    final String text = "${shareText.name} - ${shareText.description}";

    Share.share(
      text,
      subject: shareText.description,
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }

  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController _wordController = TextEditingController();
  TextEditingController _keyController = TextEditingController();
  String _result = "";
  final StreamController _dividerController = StreamController<int>();

  void _shareContent() {
    Share.share(_wordController.text);
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Material(
        child: Scaffold(
            body: Container(
      height: _height,
      width: _width,
      padding: EdgeInsets.only(bottom: 1),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(children: <Widget>[
          SizedBox(
            height: _height / 13.4,
          ),
          topButton(),
          Container(
              height: _height,
              width: _width,
              margin: new EdgeInsets.only(left: 7.0, right: 7.0),
              child: Container(
                child: Column(children: <Widget>[
                  SizedBox(
                    height: _height / 40,
                  ),
                  welcomeTextRow(),
                  SizedBox(
                    height: _height / 10,
                  ),
                  caesar(),
                  SizedBox(
                    height: _height / 5.5,
                  ),
                  bottomButton(context, 'Save as'),
                ]),
              )),
        ]),
      ),
    )));
  }

  Widget caesar() {
    final StreamController _dividerController = StreamController<int>();
    double _generateRandomAngle() => Random().nextDouble() * pi * 2;
    return Container(
      margin: EdgeInsets.only(left: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinningWheel(
            Image.asset('assets/images/caesar1.png'),
            width: 310,
            height: 310,
            initialSpinAngle: _generateRandomAngle(),
            spinResistance: 0.6,
            canInteractWhileSpinning: false,
            dividers: 8,
            onUpdate: _dividerController.add,
            onEnd: _dividerController.add,
            secondaryImage: Image.asset('assets/images/caesar2.png'),
            secondaryImageHeight: 260,
            secondaryImageWidth: 260,
          ),
        ],
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

  Widget bottomButton(BuildContext context, String title) {
    return Container(
        margin: EdgeInsets.only(left: _width / 1000, right: _width / 1000),
        child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(HOW_CAESAR);
            },
            child: Text(
              "How to Use",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[500],
                  fontSize: 16),
            ),
          ),
          SizedBox(
            width: 89,
          ),
          Column(
              children: sharetexts
                  .map((ShareText shareText) => Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: IconButton(
                          icon: Icon(Icons.share),
                          iconSize: 30,
                          color: Colors.blue[500],
                          splashColor: Colors.grey,
                          onPressed: () => share(context, shareText),
                        ),
                      ))
                  .toList()),
          SizedBox(
            width: _width / 35,
          ),
          IconButton(
            icon: Icon(Icons.print),
            iconSize: 30,
            color: Colors.blue[500],
            splashColor: Colors.grey,
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(title),
                      content:
                          Column(mainAxisSize: MainAxisSize.min, children: [
                        Image(
                          image: AssetImage("assets/images/caesar4.png"),
                          width: 130,
                          height: 130,
                        ),
                        Row(children: <Widget>[
                          SizedBox(
                            height: _height / 10,
                          ),
                          RaisedButton(
                              elevation: 0,
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1.0)),
                              onPressed: () {},
                              textColor: Colors.white,
                              padding: EdgeInsets.all(0.0),
                              child: Container(
                                alignment: Alignment.center,
                                width: _large
                                    ? _width / 1
                                    : (_medium ? _width / 5 : _width / 1),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(1.0)),
                                  gradient: LinearGradient(
                                    colors: [Colors.red[900], Colors.red[900]],
                                  ),
                                ),
                                padding: const EdgeInsets.all(12.0),
                                child: Text('JPG',
                                    style: TextStyle(
                                        fontSize:
                                            _large ? 14 : (_medium ? 16 : 10))),
                              )),
                          RaisedButton(
                              elevation: 0,
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1.0)),
                              onPressed: () {},
                              textColor: Colors.white,
                              padding: EdgeInsets.all(0.0),
                              child: Container(
                                alignment: Alignment.center,
                                width: _large
                                    ? _width / 1
                                    : (_medium ? _width / 5 : _width / 1),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(1.0)),
                                  gradient: LinearGradient(
                                    colors: [Colors.red[900], Colors.red[900]],
                                  ),
                                ),
                                padding: const EdgeInsets.all(12.0),
                                child: Text('PNG',
                                    style: TextStyle(
                                        fontSize:
                                            _large ? 14 : (_medium ? 16 : 10))),
                              )),
                          RaisedButton(
                              elevation: 0,
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1.0)),
                              onPressed: () {},
                              textColor: Colors.white,
                              padding: EdgeInsets.all(0.0),
                              child: Container(
                                alignment: Alignment.center,
                                width: _large
                                    ? _width / 1
                                    : (_medium ? _width / 5 : _width / 1),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(1.0)),
                                  gradient: LinearGradient(
                                    colors: [Colors.red[900], Colors.red[900]],
                                  ),
                                ),
                                padding: const EdgeInsets.all(12.0),
                                child: Text('PDF',
                                    style: TextStyle(
                                        fontSize:
                                            _large ? 14 : (_medium ? 16 : 10))),
                              )),
                        ]),
                        Image(
                          image: AssetImage("assets/images/caesar3.png"),
                          width: 190,
                          height: 190,
                        ),
                        Row(children: <Widget>[
                          SizedBox(
                            height: _height / 10,
                          ),
                          RaisedButton(
                              elevation: 0,
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1.0)),
                              onPressed: () {},
                              textColor: Colors.white,
                              padding: EdgeInsets.all(0.0),
                              child: Container(
                                alignment: Alignment.center,
                                width: _large
                                    ? _width / 1
                                    : (_medium ? _width / 5 : _width / 1),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(1.0)),
                                  gradient: LinearGradient(
                                    colors: [Colors.red[900], Colors.red[900]],
                                  ),
                                ),
                                padding: const EdgeInsets.all(12.0),
                                child: Text('JPG',
                                    style: TextStyle(
                                        fontSize:
                                            _large ? 14 : (_medium ? 16 : 10))),
                              )),
                          RaisedButton(
                              elevation: 0,
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1.0)),
                              onPressed: () {},
                              textColor: Colors.white,
                              padding: EdgeInsets.all(0.0),
                              child: Container(
                                alignment: Alignment.center,
                                width: _large
                                    ? _width / 1
                                    : (_medium ? _width / 5 : _width / 1),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(1.0)),
                                  gradient: LinearGradient(
                                    colors: [Colors.red[900], Colors.red[900]],
                                  ),
                                ),
                                padding: const EdgeInsets.all(12.0),
                                child: Text('PNG',
                                    style: TextStyle(
                                        fontSize:
                                            _large ? 14 : (_medium ? 16 : 10))),
                              )),
                          RaisedButton(
                              elevation: 0,
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1.0)),
                              onPressed: () {},
                              textColor: Colors.white,
                              padding: EdgeInsets.all(0.0),
                              child: Container(
                                alignment: Alignment.center,
                                width: _large
                                    ? _width / 4
                                    : (_medium ? _width / 5 : _width / 3.5),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(1.0)),
                                  gradient: LinearGradient(
                                    colors: [Colors.red[900], Colors.red[900]],
                                  ),
                                ),
                                padding: const EdgeInsets.all(12.0),
                                child: Text('PDF',
                                    style: TextStyle(
                                        fontSize:
                                            _large ? 14 : (_medium ? 16 : 10))),
                              )),
                        ]),
                      ]),
                    );
                  });
            },
          ),
        ]));
  }

  Widget welcomeTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 1000, right: _width / 1000),
      child: Text(
        "Caesar Wheel",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
      ),
    );
  }
}
