import 'package:cracker/services/auth.dart';
import 'package:cracker/ui/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:cracker/constants/constants.dart';
import 'package:cracker/ui/widgets/responsive_ui.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInScreen(),
    );
  }
}

class SignInScreen extends StatefulWidget {
  final Function toggleView;
  SignInScreen({this.toggleView});
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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

    return Material(
        child: Scaffold(
      body: Container(
        height: _height,
        width: _width,
        padding: EdgeInsets.only(bottom: 1),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: _height / 11),
              clipShape(),
              welcomeTextRow(),
              signInTextRow(),
              form(),
              forgotPasswordTextRow(),
              SizedBox(height: _height / 50),
              button(),
              orTextRow(),
              guestbutton(),
              SizedBox(height: _height / 30),
            ],
          ),
        ),
      ),
    ));
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
              image: AssetImage("assets/images/login.png"),
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
            "Login",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          ),
        ],
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 12.0),
      child: Row(
        children: <Widget>[
          Text(
            "Sign in to your account",
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
            SizedBox(height: _height / 40.0),
            passwordTextFormField(),
            errorTextRow(),
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

  Widget passwordTextFormField() {
    return Container(
      child: TextFormField(
        validator: (val) =>
            val.length < 6 ? 'Enter the password minimum 6 characters' : null,
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

  Widget forgotPasswordTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 10, right: _width / 10),
      child: Row(
        children: <Widget>[
          Text(
            " Don't have an account?  ",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(SIGN_UP);
            },
            child: Text(
              "Sign Up",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[500],
                  fontSize: 12),
            ),
          ),
          Text(
            "   or  ",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(FORGOT_PASSWORD);
            },
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[500],
                  fontSize: 12),
            ),
          )
        ],
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
              await _auth.signInWithEmailAndPassword(email, password);
          if (result == null) {
            setState(() => error = 'No account registered');
          } else {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => HomePageScreen()));
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
            colors: [Colors.blue[500], Colors.blue[500]],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('LOGIN', style: TextStyle(fontSize: 21)),
      ),
    );
  }

  Widget orTextRow() {
    return Container(
        margin: EdgeInsets.only(left: _width / 1000, top: _height / 500.0),
        child: new ButtonBar(
            mainAxisSize: MainAxisSize
                .min, // this will take space as minimum as posible(to center)
            children: <Widget>[
              Text(
                "or",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              ),
            ]));
  }

  Widget errorTextRow() {
    return Container(
        child: Text(
      error,
      style: TextStyle(color: Colors.red, fontSize: 14.0),
    ));
  }

  Widget guestbutton() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () async {
        dynamic result = await _auth.signInAnon();
        if (result == null) {
          print('Error Signing In!');
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomePageScreen()));
          print('Signed In');
          print(result.uid);
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
            colors: [Colors.blue[600], Colors.blue[600]],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('CONTINUE AS GUEST', style: TextStyle(fontSize: 21)),
      ),
    );
  }
}
