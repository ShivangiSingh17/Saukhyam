import 'package:flutter/material.dart';
import 'package:saukhyam/screens/HomePage.dart';
import 'package:saukhyam/utils/asset_utils.dart';
import 'package:saukhyam/utils/string_utils.dart';
class DrawerC extends StatefulWidget {
  @override
  _DrawerCState createState() => _DrawerCState();
}

class _DrawerCState extends State<DrawerC> {
  @override
  Widget build(BuildContext context) {
//    HomePg hpg = new HomePg();
    return SizedBox(
      width: 240.0,
      height: MediaQuery.of(context).size.height,
      child: Drawer(
        child: ListView.builder(
        itemCount: textUtils.titles.length+1,
        itemBuilder: (context,index){
          if(index==0)
          {
            return GestureDetector(
              onTap: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomePage())),
              child: DrawerHeader(

                child: Center(child:Image.asset(AssetUtils.drawer_header)),
                decoration: BoxDecoration(
                  color: Color(0xfff47444),
                ),
              ),
            );
          }
          return ListTile(
            title: Text("${textUtils.titles[index-1]}"),
            leading: AssetUtils.drawer_icons[index-1],
            onTap: (){

              controllerhomeyt.pause();

              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, "/$index");

            },
          );
        })));}
  }
