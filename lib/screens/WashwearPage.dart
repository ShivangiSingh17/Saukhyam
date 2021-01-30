import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:saukhyam/models/appbar.dart';
import 'package:saukhyam/models/drawerCustom.dart';
import 'package:saukhyam/screens/HomePage.dart';
import 'package:saukhyam/utils/string_utils.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../utils/asset_utils.dart';
class WashWear extends StatefulWidget {
  @override
  _WashWearState createState() => _WashWearState();
}

class _WashWearState extends State<WashWear> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
//  YoutubePlayerController _controller;
//  TextEditingController _idController;
//  TextEditingController _seekToController;
//
//  PlayerState _playerState;
//  YoutubeMetaData _videoMetaData;
//  double _volume = 100;
//  bool _muted = false;
//  bool _isPlayerReady = false;
//
//  final List<String> _ids = [
//    'G0TrjsnZpPw',
//  ];
  bool _isPlayerReady1 = false;
  bool _isPlayerReady2 = false;
  bool _isPlayerReady3 = false;
  PlayerState _playerState1;
  PlayerState _playerState2;
  PlayerState _playerState3;
  YoutubeMetaData _videoMetaData1;
  YoutubeMetaData _videoMetaData2;
  YoutubeMetaData _videoMetaData3;
  @override
  void initState() {
    super.initState();
    _videoMetaData1 = const YoutubeMetaData();
    _playerState1 = PlayerState.unknown;
    _videoMetaData2 = const YoutubeMetaData();
    _playerState2 = PlayerState.unknown;
    _videoMetaData3 = const YoutubeMetaData();
    _playerState3 = PlayerState.unknown;
  }
  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller1 = YoutubePlayerController(
      initialVideoId: 'G0TrjsnZpPw',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        loop: true,
      ),
    );
    YoutubePlayerController _controller2 = YoutubePlayerController(
      initialVideoId: 'qrR8-gioEYQ',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        loop: true,
      ),
    );
    YoutubePlayerController _controller3 = YoutubePlayerController(
      initialVideoId: 'eocviOvaDnk',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        loop: true,
      ),
    );



    void listener(YoutubePlayerController _controller,bool _isPlayerReady,  PlayerState _playerState,   YoutubeMetaData _videoMetaData)
     {
      if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
        setState(() {
          _playerState = _controller.value.playerState;
          _videoMetaData = _controller.metadata;
        });
      }
    }
    PageController pgc = PageController(
      viewportFraction: 0.95,

    );
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
                  child: Column(
                    children: [
                      Text(textUtils.titles[2],style:TextStyle(fontSize: MediaQuery.of(context).size.width/14,fontFamily: 'Montserrat',fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),

                Divider(thickness: 2,),

              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height/8),
            child: PageView(
              controller: pgc,
              allowImplicitScrolling: true,
              onPageChanged: (ind){
                if(ind!=1)
                  {
                    _controller1.pause();
                    _controller2.pause();
                    _controller3.pause();
                  }
              },
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height-30,
                  child: Markdown(
                      data:textUtils.washwear+textUtils.washwear2,
                    ),
                ),
                Container(
                  height: 1000,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        width: 200,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(textUtils.yt1,style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                            YoutubePlayer(
                              controller: _controller1,
                              showVideoProgressIndicator: true,
                              onReady: (){
                              },
                              onEnded: (data){
                                _controller1.pause();

                              },
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                      Container(
                        width: 200,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(textUtils.yt2,style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                            YoutubePlayer(
                              controller: _controller2,
                              showVideoProgressIndicator: true,
                              onReady: (){
                              },

                              onEnded: (data){
                                _controller2.pause();

                              },
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                      Container(
                        width: 200,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(textUtils.yt3,style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                            YoutubePlayer(
                              controller: _controller3,
                              showVideoProgressIndicator: true,
                              onReady: (){
                              },

                              onEnded: (data){
                                _controller3.pause();

                              },
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),


//          Padding(
//            padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/2),
//            child: Container(
//              child: PageView(
//                scrollDirection: Axis.horizontal,
//                children: [
//                  Container(
//                    width: 200,
//                    child: Column(
//                      children: [
//                        Padding(
//                          padding: const EdgeInsets.all(8),
//                          child: Text(textUtils.yt1,style: TextStyle(fontWeight: FontWeight.bold),),
//                        ),
//                        YoutubePlayer(
//                          controller: _controller1,
//                          showVideoProgressIndicator: true,
//                          onReady: (){
//                          },
//                        ),
//                        Divider(),
//                        Padding(
//                          padding: const EdgeInsets.all(15.0),
//                          child: Center(
//                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              children: [
//                                Icon(Icons.chevron_left),
//                                Text('Swipe'),
//                                Icon(Icons.chevron_right),
//                              ],
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  Container(
//                    width: 200,
//                    child: Column(
//                      children: [
//                        Padding(
//                          padding: const EdgeInsets.all(8),
//                          child: Text(textUtils.yt2,style: TextStyle(fontWeight: FontWeight.bold),),
//                        ),
//                        YoutubePlayer(
//                          controller: _controller2,
//                          showVideoProgressIndicator: true,
//                          onReady: (){
//                          },
//                        ),
//                        Divider(),
//                        Padding(
//                          padding: const EdgeInsets.all(15.0),
//                          child: Center(
//                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              children: [
//                                Icon(Icons.chevron_left),
//                                Text('Swipe'),
//                                Icon(Icons.chevron_right),
//                              ],
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  Container(
//                    width: 200,
//                    child: Column(
//                      children: [
//                        Padding(
//                          padding: const EdgeInsets.all(8),
//                          child: Text(textUtils.yt3,style: TextStyle(fontWeight: FontWeight.bold),),
//                        ),
//                        YoutubePlayer(
//                          controller: _controller3,
//                          showVideoProgressIndicator: true,
//                          onReady: (){
//                          },
//                        ),
//                        Divider(),
//                        Padding(
//                          padding: const EdgeInsets.all(15.0),
//                          child: Center(
//                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              children: [
//                                Icon(Icons.chevron_left),
//                                Text('Swipe'),
//                                Icon(Icons.chevron_right),
//                              ],
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//            )
//            ListView(
//              scrollDirection: Axis.horizontal,
//              children: [
//                Padding(
//                  padding: const EdgeInsets.all(8),
//                  child: Text(textUtils.yt1,style: TextStyle(fontWeight: FontWeight.bold),),
//                ),
//                YoutubePlayer(
//                  controller: _controller1,
//                  showVideoProgressIndicator: true,
//                  onReady: (){
//                  },
//                ),
//                Padding(
//                  padding: const EdgeInsets.all(8),
//                  child: Text(textUtils.yt2,style: TextStyle(fontWeight: FontWeight.bold),),
//                ),
//                YoutubePlayer(
//                  controller: _controller2,
//                  showVideoProgressIndicator: true,
//                  onReady: (){
//                  },
//                ),
//                Padding(
//                  padding: const EdgeInsets.all(8),
//                  child: Text(textUtils.yt3,style: TextStyle(fontWeight: FontWeight.bold),),
//                ),
//                YoutubePlayer(
//                  controller: _controller3,
//                  showVideoProgressIndicator: true,
//                  onReady: (){
//                  },
//                ),
//              ],
//            ),
//          ),
//          Container(
//            height: MediaQuery.of(context).size.height/2.85,
//            child: Column(
//              children: [
//                Padding(
//                  padding: const EdgeInsets.all(8),
//                  child: Text(textUtils.yt2,style: TextStyle(fontWeight: FontWeight.bold),),
//                ),
//                YoutubePlayer(
//                  controller: _controller2,
//                  showVideoProgressIndicator: true,
//                  onReady: (){
//                  },
//                ),
//              ],
//            ),
//          ),Container(
//            height: MediaQuery.of(context).size.height/2.85,
//            child: Column(
//              children: [
//                Padding(
//                  padding: const EdgeInsets.all(8),
//                  child: Text(textUtils.yt3,style: TextStyle(fontWeight: FontWeight.bold),),
//                ),
//                YoutubePlayer(
//                  controller: _controller3,
//                  showVideoProgressIndicator: true,
//                  onReady: (){
//                  },
//                ),
//              ],
//            ),
//          )
        ],
      ),
    );
//      YoutubePlayerBuilder(
//        onExitFullScreen: () {
//          // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
//          SystemChrome.setPreferredOrientations(DeviceOrientation.values);
//        },
//        player: YoutubePlayer(
//          controller: _controller,
//          showVideoProgressIndicator: true,
//          progressIndicatorColor: Colors.blueAccent,
//          topActions: <Widget>[
//            const SizedBox(width: 8.0),
//            Expanded(
//              child: Text(
//                _controller.metadata.title,
//                style: const TextStyle(
//                  color: Colors.white,
//                  fontSize: 18.0,
//                ),
//                overflow: TextOverflow.ellipsis,
//                maxLines: 1,
//              ),
//            ),
//            IconButton(
//              icon: const Icon(
//                Icons.settings,
//                color: Colors.white,
//                size: 25.0,
//              ),
//              onPressed: () {
//              },
//            ),
//          ],
//          onReady: () {
//            _isPlayerReady = true;
//          },
//          onEnded: (data) {
//          },
//        ),
//        builder: (context, player) => Scaffold(
//          key: _scaffoldKey,
//          appBar: AppBarCustom(context),
//          drawer: DrawerC(),
//          body: ListView(
//            children: [
//              Container(
//                height: 80,
//                child:  Padding(
//                  padding:  EdgeInsets.only(left:20.0,top:30.0,right: 20.0),
//                  child: Text('Wash and Wear',style:TextStyle(fontSize: MediaQuery.of(context).size.width/12,fontFamily: 'Montserrat',fontWeight: FontWeight.bold)),
//                ),
//              ),
//              Container(
//                height: MediaQuery.of(context).size.height/2,
//                child: FutureBuilder(
//                    future: rootBundle.loadString("assets/washwear.md"),
//                    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//                      if (snapshot.hasData) {
//                        return Markdown(data: snapshot.data);
//                      }
//
//                      return Center(
//                        child: CircularProgressIndicator(),
//                      );
//                    }),
//              ),
//              Padding(
//                padding:  EdgeInsets.only(left:20.0),
//                child: _text('How to use the 2-fold insert', ""),
//              ),
//              _space,
//              Padding(
//                padding:EdgeInsets.only(left:20.0,right: 20.0),
//                child: player,
//              ),
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.stretch,
//                  children: [
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
//      );
  }
//  Widget _text(String title, String value) {
//    return RichText(
//      text: TextSpan(
//        text: '$title : ',
//        style: const TextStyle(
//          color: Colors.black,
//          fontWeight: FontWeight.bold,
//        ),
//        children: [
//          TextSpan(
//            text: value ?? '',
//            style: const TextStyle(
//              color: Colors.black,
//              fontWeight: FontWeight.w300,
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//
//  Color _getStateColor(PlayerState state) {
//    switch (state) {
//      case PlayerState.unknown:
//        return Colors.grey[700];
//      case PlayerState.unStarted:
//        return Colors.pink;
//      case PlayerState.ended:
//        return Colors.red;
//      case PlayerState.playing:
//        return Colors.blueAccent;
//      case PlayerState.paused:
//        return Colors.orange;
//      case PlayerState.buffering:
//        return Colors.yellow;
//      case PlayerState.cued:
//        return Colors.blue[900];
//      default:
//        return Colors.blue;
//    }
//  }
//
//  Widget get _space => const SizedBox(height: 10);
//
//  Widget _loadCueButton(String action) {
//    return Expanded(
//      child: MaterialButton(
//        color: Colors.blueAccent,
//        onPressed: _isPlayerReady
//            ? () {
//          if (_idController.text.isNotEmpty) {
//            var id = YoutubePlayer.convertUrlToId(
//              _idController.text,
//            );
//            if (action == 'LOAD') _controller.load(id);
//            if (action == 'CUE') _controller.cue(id);
//            FocusScope.of(context).requestFocus(FocusNode());
//          } else {
//            _showSnackBar('Source can\'t be empty!');
//          }
//        }
//            : null,
//        disabledColor: Colors.grey,
//        disabledTextColor: Colors.black,
//        child: Padding(
//          padding: const EdgeInsets.symmetric(vertical: 14.0),
//          child: Text(
//            action,
//            style: const TextStyle(
//              fontSize: 18.0,
//              color: Colors.white,
//              fontWeight: FontWeight.w300,
//            ),
//            textAlign: TextAlign.center,
//          ),
//        ),
//      ),
//    );
//  }
//
//  void _showSnackBar(String message) {
//    _scaffoldKey.currentState.showSnackBar(
//      SnackBar(
//        content: Text(
//          message,
//          textAlign: TextAlign.center,
//          style: const TextStyle(
//            fontWeight: FontWeight.w300,
//            fontSize: 16.0,
//          ),
//        ),
//        backgroundColor: Colors.blueAccent,
//        behavior: SnackBarBehavior.floating,
//        elevation: 1.0,
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(50.0),
//        ),
//      ),
//    );
//  }

}
