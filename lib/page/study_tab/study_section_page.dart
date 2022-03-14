import 'package:flutter/material.dart';
import 'package:tic_quitar_2/components/buttons.dart';
import 'package:tic_quitar_2/components/text.dart';
import 'package:tic_quitar_2/data/library_contents.dart';
import 'package:tic_quitar_2/page/study_tab/study_item_page.dart';

class StudySectionPage extends StatefulWidget {
  const StudySectionPage({Key? key}) : super(key: key);

  @override
  _StudySectionPageState createState() => _StudySectionPageState();
}

class _StudySectionPageState extends State<StudySectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildText(text: "CODE_SECTION", size: 24, weight: Weight.Bold),
            InkWell(child: buildSubSectionItem(aCodes),
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyItemPage(item: aCodes))),
            ),
            InkWell(child: buildSubSectionItem(bCodes),
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyItemPage(item: bCodes))),
            ),
            InkWell(child: buildSubSectionItem(cCodes),
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyItemPage(item: cCodes))),
            ),
            InkWell(child: buildSubSectionItem(dCodes),
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyItemPage(item: dCodes))),
            ),
            InkWell(child: buildSubSectionItem(eCodes),
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyItemPage(item: eCodes))),
            ),
            InkWell(child: buildSubSectionItem(fCodes),
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyItemPage(item: fCodes))),
            ),
            InkWell(child: buildSubSectionItem(gCodes),
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyItemPage(item: gCodes))),
            ),
            InkWell(child: buildSubSectionItem(baItem),
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyItemPage(item: baItem))),
            ),
            InkWell(child: buildSubSectionItem(fiveBItem),
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyItemPage(item: fiveBItem))),
            ),
            InkWell(child: buildSubSectionItem(sixBItem),
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyItemPage(item: sixBItem))),
            ),
          ],
        ),
      ),
    );
  }
}
