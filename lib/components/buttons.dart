
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_quitar_2/components/text.dart';
import 'package:tic_quitar_2/data/color.dart';
import 'package:tic_quitar_2/data/model.dart';
import 'package:tic_quitar_2/util/widget_utils.dart';

Widget buildLibraryButton(Color color, String title) => Container(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      buildText(text: title, size: 24, weight: Weight.Bold, color: Colors.white, align: TextAlign.center),
      const Divider(height: 5, color: Colors.transparent),
      const Icon(CupertinoIcons.book_fill, size: 48, color: Colors.white),
    ],
  ),
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
);

Widget buildSubSectionItem(StudyItem? item) => Container(
  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
  child: Column(
    children: [
      const Divider(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildText(text: item!.title, size: 18, color: blackColor, weight: Weight.Bold),
          item.favorite ? const Icon(CupertinoIcons.star_fill, color: Colors.amberAccent) : const Icon(CupertinoIcons.star, color: greyColor),
        ],
      )
    ],
  ),
);

Widget buildDailyItem(DailyItem item, Color color) => Container(
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
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
              item.needGuitar? const Icon(CupertinoIcons.guitars, color: Colors.white) : const Icon(CupertinoIcons.hand_raised, color: Colors.white),
              Container(width: 10),
              buildText(text: item.title, size: 24, weight: Weight.Bold, color: Colors.white),
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
          buildText(text: "예상시간: ${item.estimateTime}분", size: 12, weight: Weight.Medium, color: Colors.white),
          buildText(text: "STEP: ${item.step}", size: 12, weight: Weight.Medium, color: Colors.white),
          buildText(text: "중요도: ${intToStar(item.important)}", size: 12, weight: Weight.Medium, color: Colors.white),
        ],
      ),
      Divider(height: 5, color: Colors.transparent),

    ],
  ),
);