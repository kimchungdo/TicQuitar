import 'package:flutter/material.dart';

import 'model.dart';
List<Widget> aImageGroup = [Image.asset('assets/images/codes/A.jpg'),Image.asset('assets/images/codes/A7.jpg'),
  Image.asset('assets/images/codes/Am.jpg'),Image.asset('assets/images/codes/AM7.jpg'),Image.asset('assets/images/codes/Am7 (1).jpg')];

List<Widget> bImageGroup = [Image.asset('assets/images/codes/B.jpg'),
  Image.asset('assets/images/codes/Bm.jpg'),Image.asset('assets/images/codes/BM7.jpg'),Image.asset('assets/images/codes/Bm7 (1).jpg')];

List<Widget> cImageGroup = [Image.asset('assets/images/codes/C.jpg'),Image.asset('assets/images/codes/C7.jpg'),
  Image.asset('assets/images/codes/CM7.jpg')];

List<Widget> dImageGroup = [Image.asset('assets/images/codes/D.jpg'),Image.asset('assets/images/codes/D7.jpg'),
  Image.asset('assets/images/codes/Dm.jpg'),Image.asset('assets/images/codes/DM7.jpg'),Image.asset('assets/images/codes/Dm 7.jpg')];

List<Widget> eImageGroup = [Image.asset('assets/images/codes/E.jpg'),Image.asset('assets/images/codes/E7.jpg'),
  Image.asset('assets/images/codes/Em.jpg'),Image.asset('assets/images/codes/EM7.jpg'),Image.asset('assets/images/codes/Em7 (1).jpg')];

List<Widget> fImageGroup = [Image.asset('assets/images/codes/F.jpg'),Image.asset('assets/images/codes/F7.jpg'),
  Image.asset('assets/images/codes/Fm.jpg'),Image.asset('assets/images/codes/FM7_(2).jpg'),Image.asset('assets/images/codes/Fm7.jpg')];

List<Widget> gImageGroup = [Image.asset('assets/images/codes/G.jpg'),Image.asset('assets/images/codes/G7.jpg'),
  Image.asset('assets/images/codes/Gm.jpg'),Image.asset('assets/images/codes/GM7.jpg'),Image.asset('assets/images/codes/Gm7 (1).jpg')];

List<Widget> ballet = [Image.asset('assets/images/codes/0001.jpg'), Image.asset('assets/images/codes/0002.jpg')];

List<Widget> fiveBallet = [Image.asset('assets/images/codes/5-M.png'),Image.asset('assets/images/codes/5-M7.png'),Image.asset('assets/images/codes/5-7.png'),Image.asset('assets/images/codes/5-minor.png'),Image.asset('assets/images/codes/5-minor7.png')];
List<Widget> sixBallet = [Image.asset('assets/images/codes/6-M.png'),Image.asset('assets/images/codes/6-M7.png'),Image.asset('assets/images/codes/6-M72.png'),Image.asset('assets/images/codes/6-7.png'),Image.asset('assets/images/codes/6-minor.png'),Image.asset('assets/images/codes/6-minor7.png')];

StudyItem aCodes = StudyItem(section: "CODE", title: "기타코드_A CODE", image: aImageGroup, favorite: false, description: "A, A7, Am, Am7, AM7" );
StudyItem bCodes = StudyItem(section: "CODE", title: "기타코드_B CODE", image: bImageGroup, favorite: false, description: "B, Bm, BM7, Bm7" );
StudyItem cCodes = StudyItem(section: "CODE", title: "기타코드_C CODE", image: cImageGroup, favorite: false, description: "C, C7, CM7" );
StudyItem dCodes = StudyItem(section: "CODE", title: "기타코드_D CODE", image: dImageGroup, favorite: false, description: "D, D7, Dm, DM7, Dm7" );
StudyItem eCodes = StudyItem(section: "CODE", title: "기타코드_E CODE", image: eImageGroup, favorite: false, description: "E, E7, Em, EM7, Em7" );
StudyItem fCodes = StudyItem(section: "CODE", title: "기타코드_F CODE", image: fImageGroup, favorite: false, description: "F, F7, Fm, FM7, Fm7" );
StudyItem gCodes = StudyItem(section: "CODE", title: "기타코드_G CODE", image: gImageGroup, favorite: false, description: "G, G7, Gm, GM7, Gm7" );
StudyItem baItem = StudyItem(section: "ETC", title: "하이(바레)코드 포지션", image: ballet, favorite: true, description: "good");
StudyItem fiveBItem = StudyItem(section: "CODE", title: "5번줄 바레 포지션", image: fiveBallet, favorite: true, description: "must");
StudyItem sixBItem = StudyItem(section: "CODE", title: "6번줄 바레 포지션", image: sixBallet, favorite: true, description: "must");