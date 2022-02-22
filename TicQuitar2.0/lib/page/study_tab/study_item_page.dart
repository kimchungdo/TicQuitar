import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tic_quitar_2/components/buttons.dart';
import 'package:tic_quitar_2/components/text.dart';
import 'package:tic_quitar_2/data/model.dart';

class StudyItemPage extends StatefulWidget {
  final StudyItem? item;
  StudyItemPage({this.item});
  @override
  _StudyItemPageState createState() => _StudyItemPageState();
}

class _StudyItemPageState extends State<StudyItemPage> {
  List<Widget> album = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            buildSubSectionItem(widget.item),
            CarouselSlider(items: widget.item!.image,
                options: CarouselOptions(
                  height: 400,
                  aspectRatio: 16/9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  //onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                )),
            buildText(text: widget.item!.description)
          ],
        ),
      ),
    );
  }
}
