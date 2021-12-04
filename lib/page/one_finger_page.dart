

import 'package:flutter/material.dart';
import 'package:tic_quitar/games/gye_name_game_page.dart';

class OneFingerPage extends StatefulWidget {
  const OneFingerPage({Key? key}) : super(key: key);

  @override
  _OneFingerPageState createState() => _OneFingerPageState();
}

class _OneFingerPageState extends State<OneFingerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(itemBuilder: (ctx, idx){
        if(idx == 0){
          return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(height: 10),
                  Center(child: Text("기본 코드 암기 ★☆☆☆☆", style: TextStyle(fontSize: 16),)),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      height: 50,
                      child: Center(child: Text("계이름 외우기", style: TextStyle(fontSize: 16),)),
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    onTap: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx)=>GyeNameGamePage())
                      );
                    },
                  ),

                  Center(child: Text("기본 스케일 암기 ★★☆☆☆", style: TextStyle(fontSize: 16),)),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      height: 50,
                      child: Center(child: Text("펜타토닉 스케일 외우기", style: TextStyle(fontSize: 16),)),
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    onTap: () async {
                      await Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx)=>GyeNameGamePage())
                      );
                    },
                  ),
                ],
              )
          );
        }

        return Container();
      },
      itemCount: 3,
      )
    );
  }
}
