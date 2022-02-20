import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
      return Container();
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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Daily"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_books),
                label: "Study"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.format_line_spacing),
                label: "Status"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.military_tech),
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
    );
  }
}