import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:saukhyam/models/appbar.dart';
import 'package:saukhyam/models/drawerCustom.dart';
import 'package:saukhyam/utils/string_utils.dart';

import '../utils/string_utils.dart';
import '../utils/string_utils.dart';

class FaqPg extends StatefulWidget {
  @override
  _FaqPgState createState() => _FaqPgState();
}

class _FaqPgState extends State<FaqPg> {
  List<int> list= [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
  @override
  void initState() {
    // TODO: implement initState
//    for(int i=0;i<20;i++)
//      list[i]=i+1;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBarCustom(context),
        drawer: DrawerC() ,
        body: Stack(
            children: [
              Padding(
                padding:  EdgeInsets.only(left:20.0,top:10.0,right: 20.0,bottom:20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(textUtils.titles[4],style:TextStyle(fontSize: MediaQuery.of(context).size.width/14,fontFamily: 'Montserrat',fontWeight: FontWeight.bold)),
                    ),
                    Divider(thickness: 2,)
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/8),
                child: ListView.builder(
                    itemCount: StringUtils.exp.length,
                    itemBuilder: (context,index){
                      return ExpandWidg(index);
                    }),
              ),
//
//              Container(
//                padding: EdgeInsets.only(left:20.0,top:100.0,right: 20.0,bottom:10.0),
//                height: MediaQuery.of(context).size.height/1.55,
//                child: ListView.builder(
//                    itemCount: StringUtils.exp.length,
//                    itemBuilder: (context,index){
//                        return ExpandWidg(index);
//                    }),
//              ),
              Divider(),

            ]));
  }
  Widget ExpandWidg(int i)
  {
    String s1 = StringUtils.exp[i];
    String s11 = StringUtils.exp1[i];

    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.green,width: 2.0)
                    ),
                  ),
                ),
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          s1,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    collapsed: Text(
                      s11,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              s11,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            )),
                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));}
}
