import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:saukhyam/screens/LoginPage.dart';
import 'package:saukhyam/utils/asset_utils.dart';
import 'file:///C:/Users/sidga/AndroidStudioProjects/saukhyam/lib/lang/engString.dart';
import 'package:saukhyam/lang/hinString.dart';
import 'package:saukhyam/utils/string_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/langSelect.dart';
import 'screens/RegisterPage.dart';
import 'screens/HomePage.dart';

import 'dart:async';
import 'services/auth_service.dart';
enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}



void main() => runApp(MaterialApp(
    home: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saukhyam',
      theme: ThemeData(
        fontFamily: 'Montserrat',

        //Color(0xFFFCFCFC)
        backgroundColor: Colors.black54,

      ),

    home: MyHomePage(title: 'Saukhyam'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation _animation;

//
//  Navigator.pushReplacement(
//  context,
//  MaterialPageRoute(builder: (context) => LGnew()));
  onDoneLoading() async {
    await checkLang();


  }
  checkLang()
  async {
    final prefs = await SharedPreferences.getInstance();

    final lang = prefs.getString('lang') ?? '';
    if(lang == '')
      {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LangSel1()));
      }
    else
      {
        switch(lang){
          case 'en': {
            textUtils = StringUtilsEn();
          }
          break;
          case 'hi':{
            textUtils = StringUtilsHi();
          }
          break;
          default:{
            textUtils = StringUtilsEn();
          }
        }
      }
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LGnew()));
  }
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
      controller=AnimationController (vsync: this,duration: Duration(milliseconds: 2000));
    _animation=Tween(begin:0.2,end:1.0).animate(controller);
    controller.forward();

    Timer(Duration(milliseconds: 3000), onDoneLoading);
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double h= MediaQuery.of(context).size.height;
    double w= MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xfff47444),
      body: Stack(
        children: <Widget>[
          FadeTransition(
            opacity: _animation,
            child:
            Container(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(child: Image.asset("assets/sk.PNG"))
                  ],

                )
            ),
          ),
        ],),

    );

  }
}
class UserProfile extends StatefulWidget {
  @override
  UserProfileState createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  Map<String, dynamic> _profile;
  bool _loading = false;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(padding: EdgeInsets.all(20), child: Text(_profile.toString())),
      Text(_loading.toString())
    ]);
  }
}