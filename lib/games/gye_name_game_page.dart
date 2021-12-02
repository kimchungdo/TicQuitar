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
  List<String> quiz = [];

  int gyeKey = Random().nextInt(7);
  //version ? quiz = korGye : quiz = engGye;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Container(height: 30),
            Container(
              child: Center(
                  child: Text("${korGye[gyeKey]}", style: TextStyle(fontSize: 56))),
              color: Colors.yellow,
              height: 100,
            ),

            Container(height: 30),

            ElevatedButton(onPressed: (){}, child: Text("${engGye[0]}")),
            ElevatedButton(onPressed: (){}, child: Text("${engGye[1]}")),
            ElevatedButton(onPressed: (){}, child: Text("${engGye[2]}")),
            ElevatedButton(onPressed: (){}, child: Text("${engGye[3]}")),
            ElevatedButton(onPressed: (){}, child: Text("${engGye[4]}")),
            ElevatedButton(onPressed: (){}, child: Text("${engGye[5]}")),
            ElevatedButton(onPressed: (){}, child: Text("${engGye[6]}")),

          ],
        ));
  }

  void whenGyeClicked() {
    //
  }

}
