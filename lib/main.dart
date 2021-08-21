import 'package:ehrmis/login1.dart';
import 'package:ehrmis/screens/components/navigationDrawer/personalInfo.dart';
import 'package:ehrmis/screens/home.dart';
import 'package:ehrmis/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:ehrmis/Register.dart';
import 'package:ehrmis/login1.dart';
import 'package:ehrmis/screens/components/navigationDrawer/About.dart';

void main() {
  runApp(
      new MaterialApp(debugShowCheckedModeBanner: false, home: new Ehrmis()));
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes: {
        RegisterScreen.id: (context) => RegisterScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        PersonalInfoScreen.id: (context) => PersonalInfoScreen(),
        Login1Screen.id: (context) => Login1Screen(),
        AboutScreen.id: (context) => AboutScreen(),
      },
    );
  }
}

class Ehrmis extends StatefulWidget {
  @override
  _EhrmisState createState() => _EhrmisState();
}

class _EhrmisState extends State<Ehrmis> {
  @override
  void initState() {
    super.initState();
    // fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new SplashScreen(
        seconds: 10,
        navigateAfterSeconds: new AfterSplash(),
        title: new Text(
          'Geeksynergy Technologies Pvt Ltd\n\n\n Developed by Sayan Roy',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19.0,
              color: Colors.teal,
              fontStyle: FontStyle.italic),
        ),
        image: new Image.asset(
          'images/logo.png',
          scale: 0.5,
        ),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: MediaQuery.of(context).size.height / 4,
        loadingText: Text(
          'Connecting Server',
          style: new TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 20.0,
            color: Colors.black,
          ),
        ),
        loaderColor: Colors.teal,
      ),
    );
  }
}
