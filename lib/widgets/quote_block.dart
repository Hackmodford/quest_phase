import 'package:flutter/material.dart';
import 'package:quest_phase/gen/fonts.gen.dart';

class QuoteBlock extends StatelessWidget {
  const QuoteBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Text(
          'Not all those who wander are lost.',
          style: TextStyle(
            fontFamily: FontFamily.timesNewRoman,
            fontStyle: FontStyle.italic,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8,),
        Text(
          '-Bilbo Baggins',
          textAlign: TextAlign.right,
          style: TextStyle(
            fontFamily: FontFamily.timesNewRoman,
            fontStyle: FontStyle.italic,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
