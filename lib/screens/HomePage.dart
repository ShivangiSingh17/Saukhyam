import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/widgets.dart';
import 'package:saukhyam/main.dart';
import 'package:saukhyam/models/appbar.dart';
import 'package:saukhyam/models/drawerCustom.dart';
import 'package:saukhyam/models/langSelect.dart';
import 'package:saukhyam/screens/AboutPage.dart';
import 'package:saukhyam/screens/CategoriesPage.dart';
import 'package:saukhyam/screens/ContactPage.dart';
import 'package:saukhyam/screens/FaqPage.dart';
import 'package:saukhyam/screens/LoginPage.dart';
import 'package:saukhyam/screens/ProductsPage.dart';
import 'package:saukhyam/screens/WashwearPage.dart';
import 'package:saukhyam/screens/YSwitchPage.dart';
import 'package:saukhyam/utils/asset_utils.dart';
import 'package:saukhyam/utils/string_utils.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';



class HomePg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat'
    ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/1': (context) => AbtPg(),
        '/2': (context) => SwitchWhy(),
        '/3': (context) => WashWear(),
        '/4': (context) => CatPg(),
        '/5': (context) => FaqPg(),
        '/6': (context) => ContactPg(),
        '/7': (context) => LangSel()
      },
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

YoutubePlayerController controllerhomeyt = YoutubePlayerController(
  initialVideoId: 'vYUlDQMGHDg',
  flags: YoutubePlayerFlags(
    autoPlay: false,
    mute: false,
    loop: true,
  ),
);
//Youtube Video
bool isPlayerReady1 = false;
PlayerState playerState1;
YoutubeMetaData videoMetaData1;




class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  bool isDraw = true;
  var uname = "Siddarth Ganesh";
  TextStyle drawerIcons = TextStyle(color: Colors.white);
  var uemail = "sidgan22@gmail.com";




  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    videoMetaData1 = const YoutubeMetaData();
    playerState1 = PlayerState.unknown;
    _animationController = AnimationController(vsync: this ,duration: Duration(milliseconds: 700),reverseDuration: Duration(milliseconds: 700));
  }
  final scaffKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    Size carouselSize =(MediaQuery.of(context).size/4);
    return Scaffold(
      key: scaffKey,
      appBar:AppBarCustom(context),

//      FlatButton.icon(
//          icon: Icon(Icons.person),
//          onPressed: (){},
//          label: Text(''),
//        ),
      drawer:DrawerC(),
//
      body: Column(
        children: [
            Expanded(
              flex: 4,
              child:YoutubePlayer(
                controller: controllerhomeyt,
                showVideoProgressIndicator: true,
                onReady: (){
                },
                onEnded: (data)
                {
                  controllerhomeyt.pause();
                },
              ) ,
            ),

          Divider(thickness: 2,),
          Expanded(
            flex: 2,
            child:
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:1,crossAxisSpacing: 5,childAspectRatio: 16/14),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: (){
                    controllerhomeyt.pause();
                    Navigator.pushNamed(context,"/${index+1}");
                  },
                  child: Card(
                    color: Color(0xfff47444),
                    child:Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AssetUtils.home_icons[index],
                          Text(textUtils.titles[index],style: TextStyle(color: Colors.white,))
                        ],
                      ),
                    ),
                  ),
                );
//                  FlatButton.icon(onPressed: (){}, icon: AssetUtils.drawer_icons[index], label: Text(textUtils.StringUtilsEn[index]));
//                    Card(
//
//                    color: Color(0xfff47444),
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                        Icon(Icons.help_outline,color: Colors.white,),
//                        Center(child: Text(home_titles[index],style: TextStyle(color: Colors.white),)),
//                      ],
//                    ),
//                  );
              },
              itemCount: textUtils.titles.length-1,
            ),
          ),
          Divider(thickness: 2,),
          Expanded(
            flex: 4,
            child:CarouselSlider(
                      items: [
                        Image.asset('images/1.jpg'),
                        Image.asset('images/2.jpg'),
                        Image.asset('images/3.jpg'),
                        Image.asset('images/4.jpg'),
                        Image.asset('images/5.jpg'),
                      ],
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height/3.25,
                        aspectRatio: 16/9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      )
                  ),
          )

        ],
      )
    );
  }

  Widget ExpandWidg(int i)
  {
    String s1 = StringUtils.exp2[i];
    String s11 = StringUtils.exp22[i];

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
                        color:  Color(0xfff47444),
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
