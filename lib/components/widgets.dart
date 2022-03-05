import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_quitar_2/components/text.dart';
import 'package:tic_quitar_2/data/model.dart';
import 'package:tic_quitar_2/util/widget_utils.dart';

Widget buildDailyTitle(DailyItem item, Color color) => Container(
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
  margin: const EdgeInsets.symmetric(vertical:5),
  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
  child: Column(
    children: [
      Divider(height: 10, color: Colors.transparent),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              item.needGuitar? Icon(CupertinoIcons.guitars, color: color) : Icon(CupertinoIcons.hand_raised, color: color),
              Container(width: 10),
              buildText(text: item.title, size: 24, weight: Weight.Bold, color: color),
            ],
          ),
          Container(),
          //const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
        ],
      ),
      Divider(height: 10, color: Colors.transparent),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildText(text: "예상시간: ${item.estimateTime}분", size: 12, weight: Weight.Medium, color: color),
          buildText(text: "STEP: ${item.step}", size: 12, weight: Weight.Medium, color: color),
          buildText(text: "중요도: ${intToStar(item.important)}", size: 12, weight: Weight.Medium, color: color),
        ],
      ),
      Divider(height: 5, color: Colors.transparent),

    ],
  ),
);