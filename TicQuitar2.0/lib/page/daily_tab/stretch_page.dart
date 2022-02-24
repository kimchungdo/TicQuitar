import 'dart:async';

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
  var _timer;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  //이부분 디스포즈 안되는듯 셋스테이트 부를때마다 오류터짐;

  void setSpeedFunction() {
    if(isPlaying == true && mounted){
      _timer = Timer.periodic(Duration(microseconds: speed * multiply), (timer) {
        if (isPlaying == true && mounted) {
          setState(() {
            _light++;
            if (_light > 3) _light = 0;
          });
        }
      });
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildText(
                text: "➀ 네 손가락을 모두 쓰며 12번 프렛까지 왕복하기",
                size: 12,
                weight: Weight.Medium,
                color: blackColor),
            const Divider(height: 5, color: Colors.transparent),
            buildText(
                text: "➁ 검지와 중지 손가락을 쓰며 12번 프렛까지 왕복하기",
                size: 12,
                weight: Weight.Medium,
                color: blackColor),
            const Divider(height: 5, color: Colors.transparent),
            buildText(
                text: "➂ 검지와 약지 손가락을 쓰며 12번 프렛까지 왕복하기",
                size: 12,
                weight: Weight.Medium,
                color: blackColor),
            const Divider(height: 5, color: Colors.transparent),
            buildText(
                text: "➃ 검지와 새끼 손가락을 쓰며 12번 프렛까지 왕복하기",
                size: 12,
                weight: Weight.Medium,
                color: blackColor),
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
              children: [
                buildText(text: "${speed}BPM", size: 24),
                IconButton(onPressed: (){
                  setState((){
                    _timer.stop();
                    speed ++;
                  });
                }, icon: Icon(Icons.add)),
                IconButton(onPressed: (){
                  setState(() {
                    _timer.stop();
                    speed --;
                  });
                }, icon: Icon(Icons.remove)),
              ],
            ),
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
