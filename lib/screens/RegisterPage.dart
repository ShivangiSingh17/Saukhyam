import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:saukhyam/screens/LoginPage.dart';
import 'package:saukhyam/services/auth_service.dart';
import 'package:saukhyam/utils/string_utils.dart';
import 'HomePage.dart';
import 'package:snack/snack.dart';
//import '../services/auth_service.dart';
import 'package:progress_dialog/progress_dialog.dart';

class rinfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: 'Montserrat'
        ),
        home:reg()
    );
  }
}

class reg extends StatefulWidget {
  @override
  regState createState() => regState();
}

class regState extends State<reg> {

  String email,pass1,pass2;
  int _rno;bool ob1=true,ob2=true;

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passController1=TextEditingController();
  TextEditingController _passController2=TextEditingController();
  int value;//_isMale is flag for male or female
  bool loading=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  ProgressDialog pr1;
  @override
  Widget build(BuildContext context) {
    pr1 = new ProgressDialog(context);
    pr1 = new ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: true, showLogs: false);
    pr1.style(
        message: 'Registering...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
    );
    MediaQueryData l;
    l = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: Stack(
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                        Widget>[
                      Container(
                        child: Stack(
                          children: <Widget>[
                            Container(
                                color:Color(0xfff47444),
                                height:MediaQuery.of(context).size.height/6,
                                child: Image.asset('assets/sk.PNG')),

                            Container(
                              padding: EdgeInsets.only(
                                  left:40.0, top: l.size.height /5),
                              child: Column(
                                children: <Widget>[

                                  Text(
                                    textUtils.reg,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: -3,
                                        fontWeight: FontWeight.w300,
                                        fontSize: l.size.height / 10,
                                        color: Color(0xfff47444)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(
                              top: 30.0,
                              left: l.size.height / 20,
                              right: l.size.height / 20),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                onSaved: (value)=>email=value,
                                validator: (val) {
                                  if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val))
                                  {
                                    return null;
                                  }
                                  else
                                    return  'Enter a valid email!';

                                } ,
                                controller: _emailController,
                                decoration: InputDecoration(
                                    contentPadding: new EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                                    border: OutlineInputBorder(borderSide: BorderSide(width: 2.0,color: Color(0xff228b22)), borderRadius: BorderRadius.circular(10.0),),
                                    labelText: textUtils.email,
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.green))),
                              ),
                              SizedBox(height: 12.0),
                              SizedBox(height: 12.0),
                              TextFormField(

                                onSaved: (value)=>pass1=value,
                                validator: (val) => val.length < 6 ? 'Enter a pass atleast 6 characters!' : val != _passController2.text ? "Passwords don't match": null,
                                controller: _passController1,
                                obscureText: ob1,
                                decoration: InputDecoration(
                                    contentPadding: new EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                                    border: OutlineInputBorder(borderSide: BorderSide(width: 2.0,color: Color(0xff228b22)), borderRadius: BorderRadius.circular(10.0),),

                                    suffixIcon: IconButton(disabledColor:Colors.grey,onPressed: (){setState(() {
                                      ob1=!ob1;

                                    });},icon: Icon(Icons.remove_red_eye),),
                                    labelText: textUtils.password,
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.green)),),
                              ),
                              SizedBox(height: 12.0),
                              SizedBox(height: 12.0),
                              TextFormField(

                                onSaved: (value)=>pass2=value,
                                validator: (val) => val.length < 6 ? 'Enter a pass atleast 6 characters!' : val != _passController1.text ? "Passwords don't match" : null,
                                controller: _passController2,
                                obscureText: ob2,
                                decoration: InputDecoration(
                                  contentPadding: new EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                                  border: OutlineInputBorder(borderSide: BorderSide(width: 2.0,color: Color(0xff228b22)), borderRadius: BorderRadius.circular(10.0),),

                                  suffixIcon: IconButton(disabledColor:Colors.grey,onPressed: (){setState(() {
                                    ob2=!ob2;

                                  });},icon: Icon(Icons.remove_red_eye),),
                                  labelText: textUtils.password,
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green)),),
                              ),
                              SizedBox(height: 12.0),
                              SizedBox(height: l.size.height / 22),
                              FlatButton(
                                onPressed: () async{
                                  //add and register
//                                var ah=Auth();
                                  if(_formKey.currentState.validate()){
                                    await pr1.show();

                                    var em =_emailController.text;
                                    var pa = _passController1.text;
                                    var res = json.decode(await register(em, pa));

  print(res['_flash_messenger']['success'].toString());
                                    pr1.hide();
                                    if(res['_flash_messenger']['success'].toString() == '[]')
                                    {
//                                      print(res['error_description']);
                                      _showDialogN(context,res['error_description'].toString());
                                    }
                                    else
                                    {
                                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> LGnew()), (route) => false);
                                    }

                                  }
                                },
                                child: Container(
                                    height: l.size.height / 16,
                                    child: Material(
                                      borderRadius: BorderRadius.circular(20.0),
                                      shadowColor: Color(0xff228B22),
                                      color: Color(0xff228B22),
                                      elevation: 7.0,
                                      child: Center(
                                        child: Text(
                                          textUtils.signup,
                                          style: TextStyle(
                                              fontSize: l.size.height / 50,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Montserrat'),
                                        ),
                                      ),
                                    )),
                              ),
                              SizedBox(height: 12.0),
                              FlatButton(
                                child:Text(textUtils.alreadyuser,style: TextStyle(
                                  color: Color(0xfff47444),
                                  fontSize: l.size.height/50,
                                  fontFamily: 'Montserrat',),),
                                onPressed: () async {
//
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>LGnew()));
                                },
                              ),
                            ],
                          )),
                    ]),
                    SizedBox(height: 12.0),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }
  void _showDialogN(context,String msg) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Try again."),
          content: new Text(msg.split(':').elementAt(1)),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK"),
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

