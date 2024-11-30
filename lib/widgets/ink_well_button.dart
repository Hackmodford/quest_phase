import 'package:flutter/material.dart';

class InkWellButton extends StatelessWidget {
  const InkWellButton({
    required this.child,
    this.onTap,
    this.onTapDown,
    this.onTapCancel,
    super.key,
  });

  final GestureTapDownCallback? onTapDown;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onTapCancel;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTapDown: (details) {
          onTapDown?.call(details);
        },
        onTap: () {
          onTap?.call();
        },
        child: child,
      ),
    );
  }
}
