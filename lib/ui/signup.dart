import 'package:cracker/services/auth.dart';
import 'package:cracker/ui/homepage.dart';
import 'package:flutter/material.dart';
import 'package:cracker/constants/constants.dart';
import 'package:cracker/ui/widgets/responsive_ui.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  final Function toggleView;
  SignUpScreen({this.toggleView});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String username = "";
  String email = "";
  String password = "";
  String error = "";

  bool checkBoxValue = false;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController textController = TextEditingController();
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
      child: Scaffold(
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                backButton(),
                clipShape(),
                welcomeTextRow(),
                signUpTextRow(),
                form(),
                SizedBox(
                  height: _height / 35,
                ),
                button(),
                SizedBox(height: _height / 50),
                signInTextRow(),
                SizedBox(height: _height / 20),
              ],
            ),
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
              image: AssetImage("assets/images/signup.png"),
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
            "Sign Up",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          ),
        ],
      ),
    );
  }

  Widget signUpTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 12.0),
      child: Row(
        children: <Widget>[
          Text(
            "Create your account",
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
        key: _formkey,
        child: Column(
          children: <Widget>[
            emailTextFormField(),
            errorTextRow(),
            SizedBox(height: _height / 120.0),
            passwordTextFormField(),
            SizedBox(height: _height / 60.0),
          ],
        ),
      ),
    );
  }

  Widget emailTextFormField() {
    return Container(
      child: TextFormField(
        validator: (val) => val.isEmpty ? 'Enter an email' : null,
        onChanged: (val) {
          setState(() => email = val);
        },
        controller: emailController,
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

  Widget passwordTextFormField() {
    return Container(
      child: TextFormField(
        validator: (val) =>
            val.length < 6 ? 'Enter a password minimum 6 characters' : null,
        onChanged: (val) {
          setState(() => password = val);
        },
        controller: passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        cursorColor: Colors.blue[500],
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock, color: Colors.blue[500], size: 20),
          hintText: "Password",
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
      onPressed: () async {
        if (_formkey.currentState.validate()) {
          dynamic result =
              await _auth.registerWithEmailAndPassword(email, password);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomePageScreen()));
          if (result == null) {
            setState(() => error = 'Please enter again');
          }
        }
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
          'SIGN UP',
          style: TextStyle(fontSize: 21),
        ),
      ),
    );
  }

  Widget errorTextRow() {
    return Container(
        child: Text(
      error,
      style: TextStyle(color: Colors.red, fontSize: 14.0),
    ));
  }

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 120.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account?",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(SIGN_IN);
            },
            child: Text(
              "Sign in",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.blue[500],
                  fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
