import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/gen/fonts.gen.dart';
import 'package:quest_phase/services/sound_effect_service.dart';
import 'package:quest_phase/widgets/cell.dart';

class AdjustableCell extends ConsumerWidget {
  const AdjustableCell({
    required this.color,
    required this.image,
    required this.text,
    this.onTapIncrease,
    this.onTapDecrease,
    this.isHighlighted = false,
    super.key,
  });

  final String text;
  final Color color;
  final Image image;
  final GestureTapCallback? onTapIncrease;
  final GestureTapCallback? onTapDecrease;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Cell(
      isHighlighted: isHighlighted,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    text,
                    style: const TextStyle(
                      height: 0.75,
                      fontFamily: FontFamily.vafthrudnir,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            4.heightBox,
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                children: [
                  GestureDetector(
                    onTapDown: (_) {
                      HapticFeedback.mediumImpact();
                      ref.read(soundEffectServiceProvider).playDecrease();
                    },
                    onTap: () {
                      onTapDecrease?.call();
                    },
                    child: const Icon(Icons.remove),
                  ),
                  Expanded(child: image),
                  GestureDetector(
                    onTapDown: (_) {
                      HapticFeedback.mediumImpact();
                      ref.read(soundEffectServiceProvider).playIncrease();
                    },
                    onTap: () {
                      onTapIncrease?.call();
                    },
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
