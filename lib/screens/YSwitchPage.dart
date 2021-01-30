import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:saukhyam/models/appbar.dart';
import 'package:saukhyam/models/drawerCustom.dart';
import 'package:saukhyam/screens/HomePage.dart';
import 'package:saukhyam/utils/string_utils.dart';

class SwitchWhy extends StatefulWidget {
  @override
  _SwitchWhyState createState() => _SwitchWhyState();
}

class _SwitchWhyState extends State<SwitchWhy> {
  final scaffKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(context),
        drawer: DrawerC() ,
        body: Stack(
          children: [
            Padding(
              padding:  EdgeInsets.only(left:20.0,top:10.0,right: 20.0,bottom:10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(textUtils.titles[1],style:TextStyle(fontSize: MediaQuery.of(context).size.width/14,fontFamily: 'Montserrat',fontWeight: FontWeight.bold)),
                  ),
                  Divider(thickness: 2,)
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/8),
              child: Markdown(data:textUtils.yswitch)
            ),
//
//            Divider(),
//            Container(
//              height: MediaQuery.of(context).size.height/1.3,
//              child: Markdown(data:textUtils.yswitch)
//            )

          ],
        )
    );
  }
}
