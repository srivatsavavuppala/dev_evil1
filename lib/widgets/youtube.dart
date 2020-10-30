import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';


class yt extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<yt> {
  Query _ref;
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('Contacts')
        .orderByChild('name');


    _controller = VideoPlayerController.network(
        "contact['number']");
    //_controller = VideoPlayerController.asset("videos/sample_video.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  Widget _buildContactItem({Map contact}) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Demo"),
      ),
      body:

      FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child:
        Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),


    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  }




