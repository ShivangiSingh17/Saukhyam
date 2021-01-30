import 'package:flutter/material.dart';
import 'package:saukhyam/models/appbar.dart';
import 'package:saukhyam/models/drawerCustom.dart';

class ProdPg extends StatefulWidget {
  @override
  _ProdPgState createState() => _ProdPgState();
}

class _ProdPgState extends State<ProdPg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(context),
      drawer: DrawerC(),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                child: GridView.count(
                  physics: ScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 3/5,
                  shrinkWrap: true,
                  children: <Widget>[
                    cardbld(context, 1, "jpg"),//uniformb
                    cardbld(context, 2, "jpg"),//unig
                    cardbld(context, 3,"jpg"),//shirt
                    cardbld(context, 4,"jpg"),//pant
                    cardbld(context, 5, "jpg"),//tsh
                    cardbld(context, 6, "jpg"),//shorts
                    cardbld(context, 7, "jpg"),//kurti
                    cardbld(context, 8, "jpg"),//salwar
                    cardbld(context, 9, "jpg"),//dhoti
                    cardbld(context, 10, "jpg"),//bedsheet

                  ],
                ),
              ),
            ],
          )
        ],

      ),
    );
  }
  Widget cardbld(BuildContext context,int i,String ext)
  {
    var l =MediaQuery.of(context).size.width;
    int a=i+1;
    return Stack(
      children: <Widget>[
        Card(
          elevation: 2.0,
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(5),),
              Expanded(
                flex:3,
                child: SizedBox(
                    height: 90,
                    child: Image.network('https://www.saukhyampads.org/environment/cache/images/300_300_productGfx_296.jpg')
                ),
              ),
              Padding(padding: EdgeInsets.all(5),),
              Center(
                child: Text("Prod Name",style: TextStyle(fontWeight:FontWeight.bold,fontSize:l/30 )),
              ),
              Divider(thickness: 1.0,),
              Padding(padding:EdgeInsets.all(5)),
              Text("Prices",style: TextStyle(fontSize:12.0 ),),
              Divider(thickness: 1.0,),
              Expanded(
                flex:2,
                child: Padding(padding: EdgeInsets.only(bottom:10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Qty"),
                      Center(
                        child: IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: (){},),
                      ),
                      SizedBox(width: 10.0,),
                      Text("1"),
                      SizedBox(width: 10.0,),
                      Center(
                        child: IconButton(
                          onPressed:(){},
                          icon: Icon(Icons.add),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],

          ),
        ),
      ],
    );
  }

}
