import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saukhyam/models/appbar.dart';
import 'package:saukhyam/models/drawerCustom.dart';
import 'package:saukhyam/screens/ProductsPage.dart';
import 'package:saukhyam/utils/string_utils.dart';

class CatPg extends StatefulWidget {
  @override
  _CatPgState createState() => _CatPgState();
}


class _CatPgState extends State<CatPg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(context),
      drawer: DrawerC(),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding:  EdgeInsets.only(left:20.0,top:30.0,right: 20.0,bottom:10.0),
              child: Text(textUtils.cat,style:TextStyle(fontSize: MediaQuery.of(context).size.width/10,fontFamily: 'Montserrat',fontWeight: FontWeight.bold)),
            ),
          ),
          Divider(thickness: 2,),
          SizedBox(height: 20,),
          Container(
            height: MediaQuery.of(context).size.height/1.5,
            child: ListView.builder(
                itemCount: textUtils.categories.length,
                itemBuilder: (context,index){
                  return Column(
                    children: [
                      ListTile(
                        trailing: Icon(Icons.chevron_right),
                        title: Text(textUtils.categories[index],style: TextStyle(fontWeight: FontWeight.bold),),

                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProdPg()));
                        },
                        contentPadding:  const EdgeInsets.all(15.0),
                      ),
                      Divider(thickness: 1.5,),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
