import 'package:flutter/material.dart';
import 'package:tic_quitar_2/components/buttons.dart';
import 'package:tic_quitar_2/components/text.dart';
import 'package:tic_quitar_2/data/color.dart';
import 'package:tic_quitar_2/data/library_contents.dart';
import 'package:tic_quitar_2/page/study_tab/study_section_page.dart';

class StudyPage extends StatefulWidget {
  const StudyPage({Key? key}) : super(key: key);

  @override
  _StudyPageState createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {

  final List<String> _gridItem = ["CODE", "TONE", "ETC"];
  final List<Color> _gridColor = [pastelOrangeColor, pastelBlueColor, pastelGreenColor, pastelPinkColor, pastelPurpleColor, pastelRedColor];
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildText(text: "Favorite", size: 24, weight: Weight.Bold),
            const Divider(height: 10),
            buildSubSectionItem(aCodes),
            buildSubSectionItem(bCodes),
            buildSubSectionItem(cCodes),
            const Divider(height: 10),
            const Divider(height: 20, color: Colors.transparent,),
            buildText(text: "Library", size: 24, weight: Weight.Bold),
            const Divider(height: 10, color: Colors.transparent,),
            GridView.count(
              //padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 50),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(_gridItem.length, (_idx){
                return InkWell(
                  child: buildLibraryButton(_gridColor[_idx%6], _gridItem[_idx]),
                  onTap: () => {
                    if(_idx == 0){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const StudySectionPage()))
                    }
                  },
                );
              }),
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            )
          ],
        )
    );
  }
}
