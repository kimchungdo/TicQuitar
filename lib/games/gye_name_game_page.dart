import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_quitar/data/chord_data.dart';

class GyeNameGamePage extends StatefulWidget {
  const GyeNameGamePage({Key? key}) : super(key: key);

  @override
  _GyeNameGamePageState createState() => _GyeNameGamePageState();
}

class _GyeNameGamePageState extends State<GyeNameGamePage> {
  bool version = true;
  List<String> quiz = korGye;
  List<String> answer = engGye;
  List<int> seed = [0, 1, 2, 3, 4, 5, 6];
  Color basicColor = Colors.yellow;

  int gyeKey = Random().nextInt(7);
  int _correct = 0;
  int _wrong = 0;

  //version ? quiz = korGye : quiz = engGye;

  void getNextGye() {
    setState(() {
      gyeKey = Random().nextInt(7);
      basicColor = Colors.yellow;
    });
  }

  void getNextSeed() {
    seed.clear();
    while (true) {
      var rand = Random().nextInt(7);
      if (!seed.contains(rand)) {
        seed.add(rand);
      }
      if (seed.length == 7) break;
    }
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Container(height: 30),
            Container(
              child: Center(
                  child:
                      Text("${quiz[gyeKey]}", style: TextStyle(fontSize: 56))),
              color: basicColor,
              height: 100,
            ),
            Container(height: 30),

            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(answer.length, (_idx) {
                return InkWell(
                  splashColor: Colors.blue,
                  //highlightColor: Colors.yellow,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(answer[seed[_idx]],
                        style: TextStyle(fontSize: 20)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFFff7f7f)),
                  ),
                  onTap: () {
                    if (seed[_idx] == gyeKey) {
                      _correct ++;
                      getNextGye();
                      getNextSeed();
                    } else {
                      _wrong ++;
                      setState(() {
                        basicColor = Colors.red;
                      });
                    }
                  },
                );
              }),
              crossAxisCount: 7,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              childAspectRatio: 1,
            ),
            TextButton(
                onPressed: () {
                  List<String> temp = [];
                  setState(() {
                    temp = quiz;
                    quiz = answer;
                    answer = temp;
                  });
                },
                child: Text("ChangeMode")),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("맞춘 갯수 : ${_correct}", style: TextStyle(fontSize: 16)),
                Text("틀린 갯수 : ${_wrong}", style: TextStyle(fontSize: 16)),
              ],
            )
          ],
        ));
  }
}
