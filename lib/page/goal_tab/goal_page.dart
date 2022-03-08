import 'package:flutter/material.dart';
import 'package:tic_quitar_2/components/text.dart';
import 'package:tic_quitar_2/data/model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class GoalPage extends StatefulWidget {
  const GoalPage({Key? key}) : super(key: key);

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  String? videoId = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=dyRsYk0LyA8");
  TextEditingController linkController = TextEditingController();
  YoutubeItem sampleItem = YoutubeItem();

  Widget buildInputField() => Container(
    child: TextField(
      controller: linkController,
      decoration: InputDecoration(
        hintText: "Input Youtube Link Please",
        suffixIcon: Icon(Icons.search),
      ),
    )
  );

  Widget buildItem(YoutubeItem item) => Container(
    child: Row(
      children: [
        Image.network(item.thumbnail!),
        buildText(text: item.title),
      ],
    ),
    decoration: BoxDecoration(
      border: Border.all()
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          buildText(text: "My Song Link", size: 24, weight: Weight.Bold),
          buildInputField(),
          TextButton(onPressed: (){
            if(linkController.text.isEmpty) {
              videoId = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=dyRsYk0LyA8");
            } else {
              videoId = YoutubePlayer.convertUrlToId(linkController.text);
            }
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Player(videoId!,'hello'))
            );
          }, child: Text("clickme")),

          //buildItem(sampleItem),
        ],
      ),
    );
  }
}


class Player extends StatefulWidget {
  final String _videoID;
  final String _videoTitle;

  Player(this._videoID, this._videoTitle);

  @override
  PlayerState createState() => PlayerState(_videoID, _videoTitle);
}

class PlayerState extends State<Player> {
  String _videoID;
  String _videoTitle;

  PlayerState(this._videoID, this._videoTitle);

  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: _videoID,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$_videoTitle',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      body: YoutubePlayer(
        key: ObjectKey(_controller),
        controller: _controller,
        actionsPadding: const EdgeInsets.only(left: 16.0),
        bottomActions: [
          CurrentPosition(),
          const SizedBox(width: 10.0),
          ProgressBar(isExpanded: true),
          const SizedBox(width: 10.0),
          RemainingDuration(),
          //FullScreenButton(),
        ],
      ),
    );
  }
}