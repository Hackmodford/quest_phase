import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:quest_phase/gen/fonts.gen.dart';

class QuoteBlock extends StatelessWidget {
  const QuoteBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Not all those who wander are lost.',
          style: TextStyle(
            fontFamily: FontFamily.timesNewRoman,
            fontStyle: FontStyle.italic,
            fontSize: 16,
          ),
        ),
        8.heightBox,
        const Text(
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
