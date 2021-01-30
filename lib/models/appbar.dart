import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:saukhyam/screens/HomePage.dart';
import 'package:saukhyam/screens/LoginPage.dart';
import 'package:saukhyam/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget AppBarCustom(BuildContext context)
{

  return AppBar(
    centerTitle: true,
    title: GestureDetector(
        onTap: (){

          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomePage()));
        },
  child: Image.asset('assets/logo.png',height: MediaQuery.of(context).size.height/35,),),
//        child: Text('Saukhyam')),
    backgroundColor: Color(0xfff47444),

    actions: [
      FlatButton.icon(onPressed: () async {

//       print(res);
        var pr = new ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
        pr.style(
            message: 'Logging Out...',
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
        await pr.show();
        var ress = await logout();
        pr.hide();
        final prefs = await SharedPreferences.getInstance();
        final email = prefs.setString('email','');
        final pass = prefs.setString('pass','');
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LGnew()));

      }, icon: Icon(Icons.remove_circle,color: Colors.white,), label: Text('Logout',style: TextStyle(color: Colors.white),))
    ],
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
        content: new Text(msg.substring(1,msg.length-1)),
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
