import 'package:flutter/material.dart';
import 'package:tic_quitar/data/chord_data.dart';

class PowerCodeGamePage extends StatefulWidget {
  const PowerCodeGamePage({Key? key}) : super(key: key);

  @override
  _PowerCodeGamePageState createState() => _PowerCodeGamePageState();
}

class _PowerCodeGamePageState extends State<PowerCodeGamePage> {
  String initLine = "┌─┬─┬─┬─┐\n├─┼─┼─┼─┤\n├─┼─┼─┼─┤\n├─┼─┼─┼─┤\n├─┼─┼─┼─┤\n└─┴─┴─┴─┘";
  List<String> initLines = ["┌─┬─┬─┬─┐","├─┼─┼─┼─┤","├─┼─┼─┼─┤","├─┼─┼─┼─┤","├─┼─┼─┼─┤","└─┴─┴─┴─┘","1"];

  Widget makeCode(List<String> codeData) {
    return Row(
      children: [
        Text("codeName"),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(codeData[0], style: TextStyle(fontSize: 20, height:1)),
            Text(codeData[1], style: TextStyle(fontSize: 20, height:1)),
            Text(codeData[2], style: TextStyle(fontSize: 20, height:1)),
            Text(codeData[3], style: TextStyle(fontSize: 20, height:1)),
            Text(codeData[4], style: TextStyle(fontSize: 20, height:1)),
            Text(codeData[5], style: TextStyle(fontSize: 20, height:1)),
            Text(codeData[6], style: TextStyle(fontSize: 20, height:1)),
          ],

        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView.builder(
            itemBuilder: (ctx, idx){
              if(idx == 0){
                return makeCode(powerECode);
              }else if(idx == 1){
                return makeCode(powerFCode);
              }else if(idx == 2){
                return makeCode(powerGCode);
              }else if(idx == 3){
                return makeCode(powerACode);
              }else if(idx == 4){
                return makeCode(powerBCode);
              }else if(idx == 5){
                return makeCode(powerCCode);
              }else if(idx == 6){
                return makeCode(powerDCode);
              }else if(idx == 7){
                return makeCode(powerHighECode);
              }

              return Container();
            },
          itemCount: 10,
        ),
      ),
    );
  }
}
