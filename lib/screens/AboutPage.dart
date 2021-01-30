import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:saukhyam/models/appbar.dart';
import 'package:saukhyam/models/drawerCustom.dart';
import 'package:saukhyam/utils/string_utils.dart';

class AbtPg extends StatefulWidget {
  @override
  _AbtPgState createState() => _AbtPgState();
}

class _AbtPgState extends State<AbtPg> {
  @override
  Widget build(BuildContext context) {
    var sht =  MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBarCustom(context),
      drawer: DrawerC(),
      body: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.only(left:20.0,top:10.0,right: 20.0,bottom:10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(textUtils.titles[0],style:TextStyle(fontSize: MediaQuery.of(context).size.width/14,fontFamily: 'Montserrat',fontWeight: FontWeight.bold)),
                ),
                Divider(thickness: 2,)
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/8),
            child: ListView.builder(
                itemCount: textUtils.cont.length,
                itemBuilder: (context,index){
                  return ExpandWidg(index);
                }),
          ),
        ],
      ),
    );
  }

  Widget ExpandWidg(int i)
  {
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
                        color: Color(0xfff47444),
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Color(0xfff47444),width: 2.0)
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
                          textUtils.ct[i],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    collapsed: Text(
                      textUtils.cont[i],
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
                              textUtils.cont[i],
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
