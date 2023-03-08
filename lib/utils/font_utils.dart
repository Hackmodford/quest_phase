import 'package:flutter/widgets.dart';
import 'package:quest_phase/gen/fonts.gen.dart';

Widget buildRichText(String text, double size) {
  final values = text.toUpperCase().split(' ');
  final firstLetters = values.map((element) {
    return TextSpan(
        text: element.substring(0, 1),
        style: TextStyle(fontSize: size, fontFamily: FontFamily.vafthrudnir));
  }).toList();
  final restOfWords = values.map((element) {
    var otherHalf = '';
    if (element.length > 1) {
      otherHalf = element.substring(1);
    }
    final firstChar = element.substring(0, 1);
    return TextSpan(
        text: otherHalf,
        style: TextStyle(
            fontSize: firstChar.contains(RegExp(r'[A-Z]')) ? size * 0.66 : size, fontFamily: FontFamily.vafthrudnir));
  }).toList();

  var spans = <TextSpan>[];
  for (var i = 0; i < firstLetters.length; i++) {
    if (i == 0) {
      spans.add(firstLetters[i]);
    } else {
      final origText = firstLetters[i].text;
      final modifiedSpan =
          TextSpan(text: ' $origText', style: firstLetters[i].style);
      spans.add(modifiedSpan);
    }
    spans.add(restOfWords[i]);
  }
  return Padding(
    padding: EdgeInsets.only(top: size * 0.33),
    child: RichText(
      text: TextSpan(children: spans),
    ),
  );
}
