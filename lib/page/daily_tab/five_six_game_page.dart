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
  int speedEasy = 60;
  int speedNormal = 100;
  int speedHard = 120;
  int speedSuperHot = 150;

  Widget buildQuizArea() => Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    height: 150,
    color: lightGreyColor,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildText(text: "A#")
        ],
      ),
    ),
  );
  
  Widget buildLevelButton(String title, Color color) => InkWell(
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: buildText(text: title, weight: Weight.Bold, color: Colors.white),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    onTap: (){},
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

                Column(
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
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildLevelButton("EASY", greyColor),
                    buildLevelButton("NORMAL", greyColor),
                    buildLevelButton("HARD", greyColor),
                  ],
                ),
                buildLevelButton("FASTEST FUXK BOII", pastelRedColor),

                
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
    );
  }
}
