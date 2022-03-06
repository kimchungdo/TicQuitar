import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_quitar_2/components/text.dart';
import 'package:tic_quitar_2/components/widgets.dart';
import 'package:tic_quitar_2/data/color.dart';
import 'package:tic_quitar_2/data/model.dart';

class FiveSixGamePage extends StatefulWidget {
  final DailyItem? item;

  FiveSixGamePage({this.item});

  @override
  State<FiveSixGamePage> createState() => _FiveSixGamePageState();
}

class _FiveSixGamePageState extends State<FiveSixGamePage> {
  bool _hint = false;
  List<String> chordDataEasy = ["C", "D", "E", "F", "G", "A", "B"];
  List<String> chordDataHard = ["C","C#", "D", "D♭", "D#", "E","E♭", "F", "F#",  "G", "G♭", "G#", "A", "A#", "A♭", "B", "B♭"];
  int speedEasy = 30;
  int speedNormal = 60;
  int speedHard = 60;
  int speedSuperHot = 80;
  int setSpeed = 30;
  List<String> chordSetData = ["C", "D", "E", "F", "G", "A", "B"];
  String setText = "C";
  bool isStart = false;
  int setDifficulty = 0;
  Widget buildQuizArea() => Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    height: 150,
    color: lightGreyColor,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildText(text: setText, size: 36, weight: Weight.Bold)
        ],
      ),
    ),
  );

  late Timer _timer;
  void setDifFunction(List<String> data) {
    double bps = setSpeed/60;
    int _tickInterval = 1000~/bps;

    if(isStart == true && mounted){
      _timer = Timer.periodic(Duration(milliseconds: _tickInterval ), (timer) {
        if (isStart == true && mounted) {
          setState(() {
            setText = data[Random().nextInt(data.length)];
          });
        }
      });
    }
    else{
      _timer.cancel();
    }
  }

  Widget buildLevelButton(String title, Color color, int dif, int speed, List<String> level) => InkWell(
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: buildText(text: title, weight: Weight.Bold, color: Colors.white),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    onTap: (){
      setState(() {
        setDifficulty = dif;
        setSpeed = speed;
        chordSetData = level;
      });
    },
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildQuizArea(),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildText(
                          text: "➀ 6번줄에서만 해결",
                          size: 14,
                          weight: Weight.Medium,
                          color: blackColor),
                      const Divider(height: 5, color: Colors.transparent),
                      buildText(
                          text: "➁ 5번줄에서만 해결",
                          size: 14,
                          weight: Weight.Medium,
                          color: blackColor),
                      const Divider(height: 5, color: Colors.transparent),
                      buildText(
                          text: "➂ 5번 6번줄을 둘다 적절히 활용하여 해결",
                          size: 14,
                          weight: Weight.Medium,
                          color: blackColor),
                      const Divider(height: 5, color: Colors.transparent),
                    ],
                  ),
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildLevelButton("EASY", setDifficulty==0 ? pastelRedColor : greyColor, 0, speedEasy, chordDataEasy),
                    buildLevelButton("NORMAL", setDifficulty==1 ? pastelRedColor : greyColor, 1, speedNormal, chordDataEasy),
                    buildLevelButton("HARD", setDifficulty==2 ? pastelRedColor : greyColor, 2, speedHard, chordDataHard),
                  ],
                ),
                buildLevelButton("FASTEST FUXK BOII", setDifficulty==3 ? pastelRedColor : greyColor, 3, speedSuperHot, chordDataHard),

                SizedBox(height: 40),
                _hint
                    ? InkWell(
                        child: Image.asset("assets/images/fivesix.jpeg",
                            width: MediaQuery.of(context).size.width),
                        onTap: () {
                          setState(() {
                            _hint = !_hint;
                          });
                        },
                      )
                    : InkWell(
                        child:
                            buildText(text: 'need hint?', weight: Weight.Bold),
                        onTap: () {
                          setState(() {
                            _hint = !_hint;
                          });
                        })
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: pastelRedColor,
        child: isStart ? const Icon(Icons.pause) : const Icon(Icons.play_arrow_rounded),
        onPressed: () {
          setState(() {
            isStart = !isStart;
            if(isStart == true) setDifFunction(chordSetData);
            else{
              _timer.cancel();
            }
          });
        },
      ),
    );
  }
}
