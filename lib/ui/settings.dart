import 'package:cracker/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cracker/constants/constants.dart';
import 'package:cracker/ui/widgets/responsive_ui.dart';
import 'package:flutter/painting.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingsScreen> {
  final AuthService _auth = AuthService();
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  bool valueNotify1 = true;
  bool valueNotify2 = false;
  bool valueNotify3 = true;

  onChangeFunction1(bool newValue1) {
    setState(() {
      valueNotify1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue2) {
    setState(() {
      valueNotify2 = newValue2;
    });
  }

  onChangeFunction3(bool newValue3) {
    setState(() {
      valueNotify3 = newValue3;
    });
  }

  bool _value = false;
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
                Container(
                  margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Column(
                    children: [
                      Divider(height: 20, thickness: 1),
                      SizedBox(height: 10),
                      buildAccountOption1(context, 'Theme'),
                      buildAccountOption2(context, 'Font Size'),
                      buildAccountOption3(context, 'Language'),
                      SizedBox(
                        height: 50,
                      ),
                      feedbackTextRow(context),
                      aboutTextRow(context),
                      howToUseTextRow(context),
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            'SIGN OUT',
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 2,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('SIGN OUT'),
                                    content: Text('Do you want to sign out?'),
                                    actions: [
                                      TextButton(
                                        child: Text('No'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      TextButton(
                                        child: Text('Yes'),
                                        onPressed: () async {
                                          await _auth.signOut();
                                          Navigator.of(context)
                                              .pushNamed(SIGN_IN);
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            )));
  }

  Widget welcomeTextRow() {
    return Container(
        margin: EdgeInsets.only(left: _width / 1000, right: _width / 1000),
        child: Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ));
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
          width: _width / 1.9,
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
      ]),
    );
  }

  Widget aboutTextRow(BuildContext context) {
    return Container(
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
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget feedbackTextRow(BuildContext context) {
    return Container(
      child: new ButtonBar(
        mainAxisSize: MainAxisSize
            .min, // this will take space as minimum as posible(to center)
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(FEEDBACK);
            },
            child: Text(
              "Feedback",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[500],
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget howToUseTextRow(BuildContext context) {
    return Container(
      child: new ButtonBar(
        mainAxisSize: MainAxisSize
            .min, // this will take space as minimum as posible(to center)
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(HOW_TO_USE);
            },
            child: Text("How to Use",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blue[500],
                    fontSize: 16)),
          ),
        ],
      ),
    );
  }

  GestureDetector buildAccountOption1(BuildContext context, String title) {
    final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);
    bool _value = false;
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(mainAxisSize: MainAxisSize.min, children: []),
                actions: [
                  ListTileSwitch(
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                    visualDensity: VisualDensity.comfortable,
                    switchType: SwitchType.cupertino,
                    switchActiveColor: Colors.blue[500],
                    title: Text('      Light Theme'),
                  ),
                  ListTileSwitch(
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                    visualDensity: VisualDensity.comfortable,
                    switchType: SwitchType.cupertino,
                    switchActiveColor: Colors.blue[500],
                    title: Text('      Dark Theme'),
                  ),
                  SizedBox(height: 30),
                  TextButton(
                    child: Text('Save'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildAccountOption2(BuildContext context, String title) {
    final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);
    double _value = 5;
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(mainAxisSize: MainAxisSize.min, children: []),
                actions: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    decoration: new BoxDecoration(
                      color: Colors.transparent,
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(5.0)),
                    ),
                    child: new Slider(
                      value: _value,
                      activeColor: Colors.blue[500],
                      inactiveColor: Colors.grey[500],
                      onChanged: (double s) {
                        setState(() {
                          _value = s;
                        });
                      },
                      divisions: 10,
                      min: 0.0,
                      max: 10.0,
                    ),
                  ),
                  SizedBox(height: 30),
                  TextButton(
                    child: Text('Save'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildAccountOption3(BuildContext context, String title) {
    int val = -1;
    final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(mainAxisSize: MainAxisSize.min, children: []),
                actions: [
                  ListTile(
                    title: Text("English"),
                    leading: Radio(
                      value: 1,
                      groupValue: val,
                      onChanged: (value) {
                        setState(() {
                          val = value;
                        });
                      },
                      activeColor: Colors.grey,
                    ),
                  ),
                  ListTile(
                    title: Text("Malay"),
                    leading: Radio(
                      value: 2,
                      groupValue: val,
                      onChanged: (value) {
                        setState(() {
                          val = value;
                        });
                      },
                      activeColor: Colors.grey,
                    ),
                  ),
                  ListTile(
                    title: Text("Chinese"),
                    leading: Radio(
                      value: 2,
                      groupValue: val,
                      onChanged: (value) {
                        setState(() {
                          val = value;
                        });
                      },
                      activeColor: Colors.grey,
                    ),
                  ),
                  ListTile(
                    title: Text("Tamil"),
                    leading: Radio(
                      value: 2,
                      groupValue: val,
                      onChanged: (value) {
                        setState(() {
                          val = value;
                        });
                      },
                      activeColor: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 30),
                  TextButton(
                    child: Text('Save'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

void setState(Null Function() param0) {}

Padding buildNotificationOption(
    String title, bool value, Function onChangeMethod) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
            activeColor: Colors.blue,
            trackColor: Colors.grey,
            value: value,
            onChanged: (bool newValue) {
              onChangeMethod(newValue);
            },
          ),
        ),
      ],
    ),
  );
}
