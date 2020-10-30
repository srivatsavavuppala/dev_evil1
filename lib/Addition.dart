import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Addition_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String videoURL = "https://www.youtube.com/watch?v=Fe8u2I3vmHU";

  YoutubePlayerController _controller;
  @override
  void initState() {

    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL)
    );

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('addition'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
            ),
          ],
        ),
      ),
    );
  }
}
