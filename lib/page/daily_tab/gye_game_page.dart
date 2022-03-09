import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_quitar_2/components/widgets.dart';
import 'dart:async';

import 'package:tic_quitar_2/data/chord_data.dart';
import 'package:tic_quitar_2/data/color.dart';
import 'package:tic_quitar_2/data/model.dart';

class GyeNameGamePage extends StatefulWidget {
  final DailyItem? item;
  GyeNameGamePage({this.item});

  @override
  _GyeNameGamePageState createState() => _GyeNameGamePageState();
}

class _GyeNameGamePageState extends State<GyeNameGamePage> {
  bool version = true;
  List<String> quiz = korGye;
  List<String> answer = engGye;
  List<int> seed = [0, 1, 2, 3, 4, 5, 6];
  Color basicColor = greyColor;
  late Timer _timer;
  int gyeKey = Random().nextInt(7);
  int _correct = 0;
  int _wrong = 0;

  int _start = 10;
  bool isTimerRun = false;

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

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
        oneSec,
            (Timer timer) => setState(() {
          if (_start < 1) {
            timer.cancel();
            isTimerRun = false;
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                title: Text('Game Over'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text("맞은 갯수: ${_correct}"),
                      Text("틀린 갯수: ${_wrong}"),
                      Text("점수: ${_correct < _wrong ? 0 : _correct * 10 - _wrong*10}")
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('좋아요', style: TextStyle(color: Colors.black)),
                    onPressed: (){
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                  ),
                  TextButton(
                    child: Text('다시할래요', style: TextStyle(color: Colors.black)),
                    onPressed: (){
                      setState(() {
                        _correct = 0;
                        _wrong = 0;
                        _start = 10;
                        basicColor = Colors.yellow;
                      });
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
          } else {
            _start = _start - 1;
          }
        }));
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white, elevation: 0,),
        body: Column(
          children: [
            buildDailyTitle(widget.item!, blackColor),
            Container(height: 30),
            Container(
              child: Center(
                  child:
                  Text("${quiz[gyeKey]}", style: TextStyle(fontSize: 56))),
              color: basicColor,
              height: 100,
            ),
            Container(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("맞춘 갯수 : ${_correct}", style: TextStyle(fontSize: 16)),
                Text("틀린 갯수 : ${_wrong}", style: TextStyle(fontSize: 16)),
              ],
            ),

            Row(
              children: [
                Expanded(child: Container(color: Colors.blue, height: 20), flex: _correct),
                Expanded(child: Container(color: Colors.red, height: 20), flex: _wrong)
              ],
            ),

            Container(height: 30),

            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(answer.length+1, (_idx) {
                if(_idx == 7){
                  return InkWell(
                    splashColor: Colors.blue,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("Change Mode"),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFFff7f77),
                      ),
                    ),
                    onLongPress: (){
                      List<String> temp = [];
                      setState(() {
                        temp = quiz;
                        quiz = answer;
                        answer = temp;
                      });
                    },
                  );
                }
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
                    if(!isTimerRun){
                      startTimer();
                      isTimerRun = true;
                    }

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
              crossAxisCount: 4,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              childAspectRatio: 1,
            ),

            Text(_start.toString()),


          ],
        ));
  }
}
