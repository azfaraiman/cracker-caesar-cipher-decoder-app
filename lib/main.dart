import 'package:cracker/services/auth.dart';
import 'package:cracker/ui/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cracker/constants/constants.dart';
import 'package:cracker/ui/homepage.dart';
import 'package:cracker/ui/howtouse.dart';
import 'package:cracker/ui/newpassword.dart';
import 'package:cracker/ui/signin.dart';
import 'package:cracker/ui/signup.dart';
import 'package:cracker/ui/splashscreen.dart';
import 'package:cracker/ui/forgotpassword.dart';
import 'package:cracker/ui/about.dart';
import 'package:cracker/ui/encryptdecrypt.dart';
import 'package:cracker/ui/settings.dart';
import 'package:cracker/ui/history.dart';
import 'package:cracker/ui/feedback.dart';
import 'package:provider/provider.dart';
import 'package:cracker/ui/caesarwheel.dart';
import 'package:cracker/ui/howcaesar.dart';
import 'package:cracker/ui/howencrypt.dart';
import 'models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: _notifier,
        builder: (_, mode, __) {
          return StreamProvider<User>.value(
            value: AuthService().user,
            initialData: null,
            child: MaterialApp(
              home: Wrapper(),
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              routes: <String, WidgetBuilder>{
                SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
                SIGN_IN: (BuildContext context) => SignInPage(),
                SIGN_UP: (BuildContext context) => SignUpScreen(),
                HOME_PAGE: (BuildContext context) => HomePageScreen(),
                FORGOT_PASSWORD: (BuildContext context) =>
                    ForgotPasswordScreen(),
                NEW_PASSWORD: (BuildContext context) => NewPasswordScreen(),
                ABOUT: (BuildContext context) => AboutScreen(),
                CAESAR_WHEEL: (BuildContext context) => CaesarWheelScreen(),
                ENCRYPT_DECRYPT: (BuildContext context) =>
                    EncryptDecryptScreen(),
                SETTINGS: (BuildContext context) => SettingsScreen(),
                HISTORY: (BuildContext context) => HistoryScreen(),
                HOW_TO_USE: (BuildContext context) => HowToUseScreen(),
                FEEDBACK: (BuildContext context) => FeedbackScreen(),
                HOW_CAESAR: (BuildContext context) => HowCaesarScreen(),
                HOW_ENCRYPT: (BuildContext context) => HowEncryptScreen(),
              },
              initialRoute: SPLASH_SCREEN,
            ),
          );
        });
  }
}
