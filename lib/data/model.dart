
import 'package:flutter/cupertino.dart';

class StudyItem{
  String section;
  String title;
  List<Widget>? image;
  bool favorite;
  String description;

  StudyItem({required this.section, required this.title, this.image, required this.favorite, required this.description});

}

class DailyItem{
  String title;
  bool needGuitar;
  int estimateTime;
  String step;
  int important;

  DailyItem({required this.title, required this.needGuitar, required this.estimateTime, required this.step, required this.important});
}