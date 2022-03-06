import 'package:flutter/material.dart';
import 'package:tic_quitar_2/components/text.dart';

class GoalPage extends StatefulWidget {
  const GoalPage({Key? key}) : super(key: key);

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          buildText(text: "My Song Link", size: 24, weight: Weight.Bold),
        ],
      ),
    );
  }
}
