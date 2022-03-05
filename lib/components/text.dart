import 'package:flutter/material.dart';
import 'package:tic_quitar_2/data/color.dart';

enum Weight { Regular, Medium, Bold }
FontWeight getWeight(Weight weight) {
  switch (weight) {
    case Weight.Regular: return FontWeight.w400;
    case Weight.Medium: return FontWeight.w500;
    case Weight.Bold: return FontWeight.w700;
  }
  return FontWeight.w100;
}

Text buildText({String? text, double size=14, Weight weight=Weight.Regular, Color? color=blackColor, TextAlign? align, TextDecoration decoration = TextDecoration.none}) => Text(
  text ?? '', style: TextStyle(fontSize: size, fontWeight: getWeight(weight), color: color, decoration: decoration), textAlign: align,
);
TextSpan buildTextSpan({String? text, double size=14, Weight weight=Weight.Regular, Color color=blackColor, TextDecoration decoration = TextDecoration.none}) => TextSpan(
  text: text, style: TextStyle(fontSize: size, fontWeight: getWeight(weight), color: color, decoration: decoration),
);
