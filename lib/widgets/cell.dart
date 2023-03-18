import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  const Cell({
    super.key,
    this.color,
    this.child,
    this.isHighlighted = false,
  });

  final Color? color;
  final Widget? child;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 48),
      child: Stack(
        children: [
          Ink(
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
                      color: Colors.yellow,
                    ),
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
