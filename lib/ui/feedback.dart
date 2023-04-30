import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cracker/constants/constants.dart';
import 'package:cracker/ui/widgets/responsive_ui.dart';

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FeedbackScreen(),
    );
  }
}

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController _wordController = TextEditingController();
  String _result = "";

  @override
  void dispose() {
    _wordController.dispose();
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
                inputText(),
                submitButton(),
              ]),
            )));
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

  Widget welcomeTextRow() {
    return Container(
        margin: EdgeInsets.only(left: _width / 1000, right: _width / 1000),
        child: Text(
          "Feedback",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ));
  }

  Widget inputText() {
    return Container(
      margin: new EdgeInsets.only(left: 7.0, right: 7.0),
      height: 250,
      width: 400,
      child: TextField(
        toolbarOptions:
            ToolbarOptions(copy: true, paste: true, cut: true, selectAll: true
                //by default all are disabled 'false'
                ),
        minLines: 9,
        maxLines: 9,
        decoration: InputDecoration(
          labelText: 'Feedback',
          hintText: 'Share your feedback here',
          contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 12),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 3,
                color: Colors.blue[500],
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 1, color: Colors.blue[500])),
        ),
        controller: _wordController,
        keyboardType: TextInputType.multiline,
      ),
    );
  }

  Widget submitButton() {
    return Container(
      margin: const EdgeInsets.only(left: 200.0, right: 1.0),
      child: RaisedButton(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Column(mainAxisSize: MainAxisSize.min, children: [
                      Row(
                        children: <Widget>[
                          Column(children: <Widget>[
                            Text('Submitted!'),
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
                });
          },
          textColor: Colors.white,
          padding: EdgeInsets.all(0.0),
          child: Container(
            alignment: Alignment.center,
            width:
                _large ? _width / 4 : (_medium ? _width / 3.8 : _width / 3.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              gradient: LinearGradient(
                colors: [Colors.blue[500], Colors.blue[500]],
              ),
            ),
            padding: const EdgeInsets.all(12.0),
            child: Text('SUBMIT', style: TextStyle(fontSize: 17)),
          )),
    );
  }
}
