import 'package:flutter/material.dart';
import 'package:tic_quitar_2/components/buttons.dart';
import 'package:tic_quitar_2/components/text.dart';
import 'package:tic_quitar_2/data/color.dart';
import 'package:tic_quitar_2/data/model.dart';
import 'package:tic_quitar_2/page/construction_page.dart';
import 'package:tic_quitar_2/page/daily_tab/five_six_game_page.dart';
import 'package:tic_quitar_2/page/daily_tab/gye_game_page.dart';
import 'package:tic_quitar_2/page/daily_tab/stretch_page.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({Key? key}) : super(key: key);

  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  DailyItem stretch = DailyItem(
      title: "매일매일 스트레칭",
      needGuitar: true,
      estimateTime: 20,
      step: "입문",
      important: 4);
  DailyItem gyeGame = DailyItem(
      title: "계이름 게임",
      needGuitar: false,
      estimateTime: 1,
      step: "입문",
      important: 1);
  DailyItem fiveSixGame = DailyItem(
    title: "5번줄 6번줄 외우기 게임",
    needGuitar: true,
    estimateTime: 10,
    step: '입문',
    important: 5,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildText(text: "TODO", size: 24, weight: Weight.Bold),
            const Divider(height: 5, color: Colors.transparent),
            InkWell(
                child: buildDailyItem(stretch, pastelRedColor),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StretchPage(item: stretch)));
                }),
            InkWell(
              child: buildDailyItem(gyeGame, pastelPurpleColor),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GyeNameGamePage()));
              },
            ),
            InkWell(
              child: buildDailyItem(fiveSixGame, pastelBlueColor),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FiveSixGamePage(item: fiveSixGame,)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
