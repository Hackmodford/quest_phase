import 'package:flutter/material.dart';
import 'package:quest_phase/widgets/cell.dart';

class AdjustableCell extends StatelessWidget {
  final String text;
  final Color color;
  final Image image;
  final GestureTapCallback? onTapIncrease;
  final GestureTapCallback? onTapDecrease;
  final bool isHighlighted;

  const AdjustableCell(
      {Key? key,
      this.onTapIncrease,
      this.onTapDecrease,
      required this.color,
      required this.image,
      required this.text,
      this.isHighlighted = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Cell(
      isHighlighted: isHighlighted,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(4)),
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 2.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: onTapDecrease,
                    child: const Icon(Icons.remove),
                  ),
                  Expanded(child: image),
                  GestureDetector(
                    onTap: onTapIncrease,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
