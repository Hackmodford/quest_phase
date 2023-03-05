import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final bool isHighlighted;

  const Cell({Key? key, this.color, this.child, this.isHighlighted = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 48),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: child,
            ),
          ),
          Positioned(
            child: IgnorePointer(
              child: Visibility(
                visible: isHighlighted,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      width: 2,
                        color: Colors.yellow, strokeAlign: StrokeAlign.inside),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
