import 'package:flutter/material.dart';

class PentatonicLecturePage extends StatefulWidget {
  const PentatonicLecturePage({Key? key}) : super(key: key);

  @override
  _PentatonicLecturePageState createState() => _PentatonicLecturePageState();
}

class _PentatonicLecturePageState extends State<PentatonicLecturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Image.asset("assets/img/pentasample.png"),
      ),
    );
  }
}
