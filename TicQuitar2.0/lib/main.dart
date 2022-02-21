import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tic_quitar_2/data/color.dart';
import 'package:tic_quitar_2/page/study_page.dart';

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
        primarySwatch: primaryOrange,
      ),
      home: const MyHomePage(title: 'HomePage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  Widget getPage(){
    if(currentIndex == 0){
      return Container();
    }else if(currentIndex == 1){
      return const StudyPage();
    }else if(currentIndex == 2){
      return Container();
    }else{
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: getPage(),backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Daily"
            ),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.book_fill),
                label: "Study"
            ),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chart_bar_fill),
                label: "Status"
            ),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.flame_fill),
                label: "Goal"
            ),
          ],
          currentIndex: currentIndex,
          onTap: (idx){
            setState((){
              currentIndex = idx;
            });
          }
      ),
      drawer: Drawer(),
    );
  }
}
