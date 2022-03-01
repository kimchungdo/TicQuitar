import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:tic_quitar_2/components/text.dart';
import 'package:tic_quitar_2/components/widgets.dart';
import 'package:tic_quitar_2/data/color.dart';
import 'package:tic_quitar_2/data/model.dart';

class StretchPage extends StatefulWidget {
  final DailyItem? item;
  StretchPage({this.item});

  @override
  _StretchPageState createState() => _StretchPageState();
}

class _StretchPageState extends State<StretchPage> {
  int _light = 0;
  int speed = 60;
  bool isPlaying = false;
  int multiply = 16667;   //microseconds...1,000,000 / 60 = 16666.666666...


  late Timer _timer;
  AudioCache audioPlayer =  AudioCache();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  play() async{
    const audioPath = 'audio/Drum-Sticks.mp3';
    audioPlayer.play(audioPath);
  }

  void setSpeedFunction() {
    double bps = speed/60;
    int _tickInterval = 1000~/bps;

    if(isPlaying == true && mounted){
      _timer = Timer.periodic(Duration(milliseconds: _tickInterval ), (timer) {
        if (isPlaying == true && mounted) {
          play();
          setState(() {
            _light++;
            if (_light > 3) _light = 0;
          });
        }
      });
    }
    else{
      _timer.cancel();
    }
  }

  Widget buildMetronome() => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 150,
        color: lightGreyColor,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _light == 0 ? Colors.red : blackColor),
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _light == 1 ? Colors.red : blackColor),
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _light == 2 ? Colors.red : blackColor),
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _light == 3 ? Colors.red : blackColor),
              ),
              Container(),
            ],
          ),
        ),
      );

  Widget buildGuide() => Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildText(
                text: "➀ 네 손가락을 모두 쓰며 12번 프렛까지 왕복하기",
                size: 14,
                weight: Weight.Medium,
                color: blackColor),
            const Divider(height: 5, color: Colors.transparent),
            buildText(
                text: "➁ 검지와 중지 손가락을 쓰며 12번 프렛까지 왕복하기",
                size: 14,
                weight: Weight.Medium,
                color: blackColor),
            const Divider(height: 5, color: Colors.transparent),
            buildText(
                text: "➂ 검지와 약지 손가락을 쓰며 12번 프렛까지 왕복하기",
                size: 14,
                weight: Weight.Medium,
                color: blackColor),
            const Divider(height: 5, color: Colors.transparent),
            buildText(
                text: "➃ 검지와 새끼 손가락을 쓰며 12번 프렛까지 왕복하기",
                size: 14,
                weight: Weight.Medium,
                color: blackColor),
          ],
        ),
      );
  Widget buildPreset(int num) => InkWell(
    child: Container(
      alignment: Alignment.center,
      width: 50,
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: buildText(text: num.toString(), size: 14, weight: Weight.Bold , color: Colors.white),
      decoration: BoxDecoration(
        color: pastelRedColor,
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    onTap: ()=>{
      setState((){
        speed = num;
      })
    },
  );
  Widget buildPresets() => Container(
    padding: EdgeInsets.symmetric(vertical: 20),
    child: Column(
      children: [
        //buildText(text: "----BPM PreSets----", weight: Weight.Bold,size: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildPreset(60),
            buildPreset(70),
            buildPreset(80),
            buildPreset(90),
            buildPreset(100)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildPreset(110),
            buildPreset(120),
            buildPreset(130),
            buildPreset(140),
            buildPreset(150)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildPreset(160),
            buildPreset(170),
            buildPreset(180),
            buildPreset(190),
            buildPreset(200)
          ],
        ),
      ],
    ),

  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDailyTitle(widget.item!, blackColor),
            buildMetronome(),
            buildGuide(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                  setState(() {
                    speed --;
                  });
                }, icon: const Icon(Icons.remove)),
                buildText(text: "${speed}BPM", size: 24),
                IconButton(onPressed: (){
                  setState((){
                    speed ++;
                  });
                }, icon: const Icon(Icons.add)),
              ],
            ),
            buildPresets()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: pastelRedColor,
        child: isPlaying ? const Icon(Icons.pause) : const Icon(Icons.play_arrow_rounded),
        onPressed: () {
          setState(() {
            isPlaying = !isPlaying;
          });
          setSpeedFunction();
        },
      ),
    );
  }
}
