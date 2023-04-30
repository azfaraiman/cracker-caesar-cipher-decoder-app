import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cracker/constants/constants.dart';
import 'package:cracker/ui/widgets/responsive_ui.dart';
import 'package:share/share.dart';
import 'widgets/sharetext.dart';

class EncryptDecryptPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EncryptDecryptScreen(),
    );
  }
}

class EncryptDecryptScreen extends StatefulWidget {
  @override
  _EncryptDecryptScreenState createState() => _EncryptDecryptScreenState();
}

class _EncryptDecryptScreenState extends State<EncryptDecryptScreen> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController _wordController = TextEditingController();
  TextEditingController _keyController = TextEditingController();
  String _result = "";

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
                  inputText(),
                  copyPasteInput(),
                  SizedBox(
                    height: _height / 50,
                  ),
                  rowEncryptDecrypt(),
                  SizedBox(
                    height: _height / 30,
                  ),
                  outputText(),
                  SizedBox(
                    height: _height / 40,
                  ),
                  outputAnswer(),
                  copyPasteOutput(),
                  resetButton(),
                  bottomButton(),
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
          "Encrypt Decrypt",
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

  Widget bottomButton() {
    return Container(
        margin: const EdgeInsets.only(top: 40, left: 30.0, right: 30.0),
        child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(HOW_ENCRYPT);
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
            width: _width / 12,
          ),
          IconButton(
            icon: Icon(
              Icons.history,
            ),
            iconSize: 30,
            color: Colors.blue[500],
            splashColor: Colors.grey,
            onPressed: () async {
              Navigator.of(context).pushNamed(HISTORY);
            },
          ),
          SizedBox(
            width: _width / 35,
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
            icon: Icon(Icons.save),
            iconSize: 30,
            color: Colors.blue[500],
            splashColor: Colors.grey,
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content:
                          Column(mainAxisSize: MainAxisSize.min, children: [
                        Row(
                          children: <Widget>[
                            Column(children: <Widget>[
                              Text('Saved to history!'),
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
          ),
        ]));
  }

  Widget inputText() {
    return Container(
      margin: new EdgeInsets.only(left: 30.0, right: 30.0),
      height: 100,
      width: 400,
      child: TextField(
        toolbarOptions:
            ToolbarOptions(copy: true, paste: true, cut: true, selectAll: true
                //by default all are disabled 'false'
                ),
        minLines: 1,
        maxLines: 2,
        decoration: InputDecoration(
          labelText: 'Input',
          hintText: 'Enter Your Text',
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

  Widget copyPasteInput() {
    return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.copy,
                ),
                iconSize: 25,
                color: Colors.blue[500],
                splashColor: Colors.grey,
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: _wordController.text));
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.paste,
                ),
                iconSize: 25,
                color: Colors.blue[500],
                splashColor: Colors.grey,
                onPressed: () async {
                  Clipboard.getData(Clipboard.kTextPlain).then((value) {
                    _wordController.text = _wordController.text + value.text;
                  });
                },
              ),
            ]));
  }

  Widget outputAnswer() {
    return Container(
        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
        child: SelectableText(
          _result,
          toolbarOptions:
              ToolbarOptions(copy: true, paste: true, cut: true, selectAll: true
                  //by default all are disabled 'false'
                  ),
          style: TextStyle(fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
        height: 100,
        width: 400,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ));
  }

  Widget rowEncryptDecrypt() {
    return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            RaisedButton(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                onPressed: () {
                  this._process(true);
                },
                textColor: Colors.white,
                padding: EdgeInsets.all(0.0),
                child: Container(
                  alignment: Alignment.center,
                  width: _medium ? _width / 4 : _width / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    gradient: LinearGradient(
                      colors: [Colors.blue[500], Colors.blue[500]],
                    ),
                  ),
                  padding: const EdgeInsets.all(12.0),
                  child: Text('ENCRYPT', style: TextStyle(fontSize: 15)),
                )),
            Container(
              width: 70,
              child: TextField(
                minLines: 1,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: 'Key',
                  hintText: '0',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 1, horizontal: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.blue[500],
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          BorderSide(width: 1, color: Colors.blue[500])),
                ),
                controller: _keyController,
                keyboardType: TextInputType.number,
              ),
            ),
            RaisedButton(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                onPressed: () {
                  this._process(false);
                },
                textColor: Colors.white,
                padding: EdgeInsets.all(0.0),
                child: Container(
                  alignment: Alignment.center,
                  width: _medium ? _width / 4 : _width / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    gradient: LinearGradient(
                      colors: [Colors.blue[500], Colors.blue[500]],
                    ),
                  ),
                  padding: const EdgeInsets.all(12.0),
                  child: Text('DECRYPT', style: TextStyle(fontSize: 15)),
                )),
          ],
        ));
  }

  Widget outputText() {
    return Container(
        margin: new EdgeInsets.only(left: 7.0, right: 260.0),
        child: Text(
          'Output :',
          style: TextStyle(fontSize: 18.0),
          textAlign: TextAlign.left,
        ));
  }

  Widget copyPasteOutput() {
    return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.copy,
                ),
                iconSize: 25,
                color: Colors.blue[500],
                splashColor: Colors.grey,
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: _result));
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.paste,
                ),
                iconSize: 25,
                color: Colors.blue[500],
                splashColor: Colors.grey,
                onPressed: () async {
                  Clipboard.getData(Clipboard.kTextPlain).then((value) {
                    _result = _result + value.text;
                  });
                },
              ),
            ]));
  }

  Widget resetButton() {
    return Container(
        margin: new EdgeInsets.only(left: 210.0, right: 30.0),
        child: RaisedButton(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            onPressed: () {
              _delete();
            },
            textColor: Colors.white,
            padding: EdgeInsets.all(0.0),
            child: Container(
              alignment: Alignment.center,
              width:
                  _large ? _width / 3 : (_medium ? _width / 3 : _width / 3.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                gradient: LinearGradient(
                  colors: [Colors.red[900], Colors.red[900]],
                ),
              ),
              padding: const EdgeInsets.all(12.0),
              child: Text('RESET', style: TextStyle(fontSize: 17)),
            )));
  }

  void _process(bool _isEncrypt) {
    String _text = _wordController.text;
    int _key;
    String _temp = "";

    try {
      _key = int.parse(_keyController.text);
    } catch (e) {
      _showAlert("Invalid Key");
    }

    for (int i = 0; i < _text.length; i++) {
      int ch = _text.codeUnitAt(i);
      int offset;
      String h;
      if (ch >= 'a'.codeUnitAt(0) && ch <= 'z'.codeUnitAt(0)) {
        offset = 97;
      } else if (ch >= 'A'.codeUnitAt(0) && ch <= 'Z'.codeUnitAt(0)) {
        offset = 65;
      } else if (ch == ' '.codeUnitAt(0)) {
        _temp += " ";
        continue;
      } else {
        _showAlert("Invalid Text");
        _temp = "";
        break;
      }

      int c;
      if (_isEncrypt) {
        c = (ch + _key - offset) % 26;
      } else {
        c = (ch - _key - offset) % 26;
      }
      h = String.fromCharCode(c + offset);
      _temp += h;
    }

    setState(() {
      _result = _temp;
    });
  }

  void _delete() {
    _wordController.clear();
    _keyController.clear();
    setState(() {
      _result = "";
    });
  }

  Future<void> _showAlert(String _alert) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Something is Wrong'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(_alert),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
