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
  Color basicColor = Colors.yellow;

  int gyeKey = Random().nextInt(7);
  //version ? quiz = korGye : quiz = engGye;

  void getNextGye(){
    setState(() {
      gyeKey = Random().nextInt(7);
      basicColor = Colors.yellow;
    });
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
                  child: Text("${korGye[gyeKey]}", style: TextStyle(fontSize: 56))),
              color: basicColor,
              height: 100,
            ),

            Container(height: 30),

/*            ElevatedButton(onPressed: (){}, child: Text("${engGye[0]}")),
            ElevatedButton(onPressed: (){}, child: Text("${engGye[1]}")),
            ElevatedButton(onPressed: (){}, child: Text("${engGye[2]}")),
            ElevatedButton(onPressed: (){}, child: Text("${engGye[3]}")),
            ElevatedButton(onPressed: (){}, child: Text("${engGye[4]}")),
            ElevatedButton(onPressed: (){}, child: Text("${engGye[5]}")),
            ElevatedButton(onPressed: (){}, child: Text("${engGye[6]}")),*/

            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(engGye.length, (_idx){
                return InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(engGye[_idx], style: TextStyle(fontSize: 20)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFFff7f7f)
                    ),
                  ),
                  onTap: (){
                    if(_idx == gyeKey){
                      print("정답");
                      getNextGye();
                    }
                    else{
                      setState(() {
                        basicColor = Colors.red;
                      });
                    }

                    },
                );
              }),
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              childAspectRatio: 1,
            )
          ],
        ));
  }

  void whenGyeClicked() {
    //
  }

}
