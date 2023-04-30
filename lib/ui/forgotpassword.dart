import 'package:cracker/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cracker/constants/constants.dart';
import 'package:cracker/ui/widgets/responsive_ui.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ForgotPasswordScreen(),
    );
  }
}

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String username = "";
  String email = "";
  String password = "";
  String error = "";
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;

  TextEditingController textController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    String email = "";
    TextEditingController textController = TextEditingController();
    return Material(
      child: Container(
        height: _height,
        width: _width,
        padding: EdgeInsets.only(bottom: 1),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              backButton(),
              clipShape(),
              welcomeTextRow(),
              forgotTextRow(),
              SizedBox(height: _height / 20),
              form(),
              SizedBox(height: _height / 30),
              button(),
            ],
          ),
        ),
      ),
    );
  }

  Widget backButton() {
    return Container(
      padding: EdgeInsets.only(right: _width / 1.3, top: _height / 13.0),
      child: Container(
        alignment: Alignment.center,
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
          iconSize: 30,
          color: Colors.blue[500],
          splashColor: Colors.grey,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
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
            height: 230,
            child: Image(
              image: AssetImage("assets/images/forgotpassword.png"),
              fit: BoxFit.contain,
            ),
          ),
        ]))),
      )
    ]);
  }

  Widget welcomeTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 12, top: _height / 100),
      child: Row(
        children: <Widget>[
          Text(
            "Reset Password",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
        ],
      ),
    );
  }

  Widget forgotTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 12.0),
      child: Row(
        children: <Widget>[
          Text(
            "Enter your email to reset password",
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 17.5),
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 50.0),
      child: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            emailTextFormField(),
            SizedBox(height: _height / 40.0),
          ],
        ),
      ),
    );
  }

  Widget emailTextFormField() {
    return Container(
      child: TextFormField(
        validator: (val) => val.isEmpty ? 'Enter the email' : null,
        onChanged: (val) {
          setState(() => email = val);
        },
        keyboardType: TextInputType.text,
        cursorColor: Colors.blue[500],
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail, color: Colors.blue[500], size: 20),
          hintText: "Email",
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.blue[500],
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        Navigator.of(context).pushNamed(NEW_PASSWORD);
        print("Routing to New Password screen");
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: _medium ? _width / 1.5 : _width / 1.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: [Colors.blue[500], Colors.blue[500]],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('SUBMIT', style: TextStyle(fontSize: 21)),
      ),
    );
  }
}
