import 'package:flutter/material.dart';
import 'package:saukhyam/models/appbar.dart';
import 'package:saukhyam/models/drawerCustom.dart';
import 'package:saukhyam/utils/string_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactPg extends StatefulWidget {
  @override
  _ContactPgState createState() => _ContactPgState();
}

class _ContactPgState extends State<ContactPg> {
  _launchUrl(String url) async{

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchEmail() async
  {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'info.saukhyampads@gmail.com',
      query: 'subject=Feedback &body=Please tell us your feedback', //add subject and body here
    );

    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  String mapURL = 'https://www.google.com/maps/place/Mata+Amritanandamayi+Math/@9.088731,76.486935,14z/data=!4m5!3m4!1s0x0:0x1a33d40c3847a1dd!8m2!3d9.0887307!4d76.4869353?hl=en-IN';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(context),
        drawer: DrawerC() ,
        body: Container(
          height: MediaQuery.of(context).size.height,
          color:Colors.white,
          child: ListView(
            children: [
              Padding(
                padding:  EdgeInsets.only(left:20.0,top:30.0,right: 20.0,bottom:10.0),
                child: Center(child: Text(textUtils.titles[5],style:TextStyle(fontSize: MediaQuery.of(context).size.width/10,fontFamily: 'Montserrat',fontWeight: FontWeight.bold))),
              ),
              Divider(),
              Padding(
                padding:EdgeInsets.only(left:20.0,top:10.0,right: 20.0,bottom:10.0),
                child: Center(
                  child:  Image.asset('assets/logo-full.png'),),
              ),
              Divider(),
              Padding(
                padding:EdgeInsets.only(left:20.0,top:20.0,bottom:10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FlatButton.icon(onPressed: _launchEmail, icon:Icon(Icons.email), label: Text('info.saukhyampads@gmail.com',style: TextStyle(
                        fontSize: 15
                    ),),),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding:EdgeInsets.only(left:30.0,top:20.0,right: 20.0,bottom:10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(textUtils.moredeets,style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 20,),
                    FlatButton.icon(onPressed: (){_launchUrl('https://www.amritapuri.org');}, icon: Icon(Icons.web,color: Colors.blue,), label: Text('www.amritapuri.org',style: TextStyle(
                        fontSize: 15
                    ),)),
                    SizedBox(height: 10,),
                    FlatButton.icon(onPressed: (){ _launchUrl('https://www.embracingtheworld.org');}, icon: Icon(Icons.web,color: Colors.blue), label: Text('www.embracingtheworld.org',style: TextStyle(
                        fontSize: 15
                    ),)),
                    SizedBox(height: 10,),
                    FlatButton.icon(onPressed: (){_launchUrl('https://www.amritaserve.org');}, icon: Icon(Icons.web,color: Colors.blue,), label: Text('www.amritaserve.org',style: TextStyle(
                        fontSize: 15
                    ),)),
                    SizedBox(height: 10,),
                    FlatButton.icon(onPressed: (){_launchUrl(mapURL);}, icon: Icon(Icons.location_on,color: Colors.red,), label: Text('Location',style: TextStyle(
                        fontSize: 15
                    ),))
                  ],
                ),
              ),


            ],
          ),
        )
    );
  }
}
