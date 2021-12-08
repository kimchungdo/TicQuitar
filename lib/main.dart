import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_quitar/page/fingers_page.dart';
import 'package:tic_quitar/page/one_finger_page.dart';
import 'package:tic_quitar/page/stroke_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;          //BottomNavigation Bar 식별 Index


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: getPage(),

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "홈"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.fingerprint),
              label: "한개"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.format_line_spacing),
              label: "여러개"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_circle_down_sharp),
              label: "내려치기"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.grade_outlined),
              label: "도전"
          ),
        ],
        currentIndex: currentIndex,
        onTap: (idx){
          setState((){
            currentIndex = idx;
          });
        }
      ),
    );
  }


  Widget getPage(){
    if(currentIndex == 0){
      return buildHomePage();
    }else if(currentIndex == 1){
      return const OneFingerPage();
    }else if(currentIndex == 2){
      return const FingersPage();
    }else if(currentIndex == 3){
      return const StrokePage();
    }else{
      return Container();
    }
  }

  List<String> goodWords = ["얼터네이트 피킹을 배우는게 정말 어려웠다.\n 평생 못할줄 알았다",
    "내가 꿈꿔왔던 사람이 되기엔 아직 늦지 않았다",
    "기타는 쉬워요. 손가락 5개, 기타줄 6개, 엉덩이 1개만 있으면 됩니다"];
  List<String> whoSayThat = ["폴 길버트", "존 레논", "키스 리차드"];
  int todayGoodWord = 0;


  Widget buildHomePage(){
    todayGoodWord = Random().nextInt(goodWords.length);

    return Container(
      child: Center(
        child: Column(
          children: [
            Image.asset("assets/img/sample.png"),
            Text(goodWords[todayGoodWord]),
            Text(whoSayThat[todayGoodWord])
          ],
        ),
      ),
    );
  }

}
