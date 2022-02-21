import 'package:flutter/material.dart';
import 'package:tic_quitar_2/components/text.dart';

class StudyPage extends StatefulWidget {
  const StudyPage({Key? key}) : super(key: key);

  @override
  _StudyPageState createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            buildText(text: "Favorite", size: 24, weight: Weight.Bold),
            buildText(text: "Library", size: 24, weight: Weight.Bold),
          ],
        )
    );
  }
}
