import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/gen/assets.gen.dart';
import 'package:quest_phase/gen/colors.gen.dart';
import 'package:quest_phase/gen/fonts.gen.dart';
import 'package:quest_phase/providers/willpower_total_provider.dart';
import 'package:quest_phase/utils/font_utils.dart';
import 'package:quest_phase/widgets/cell.dart';

class TotalWillpowerCell extends HookConsumerWidget {
  const TotalWillpowerCell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(willpowerTotalProvider).toString();
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(4),
      child: Cell(
        color: ColorName.willpowerBackground,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.images.willpower.image(
                    width: 24,
                    height: 24,
                    fit: BoxFit.scaleDown,
                  ),
                  4.widthBox,
                  buildRichText('Total', 20),
                ],
              ),
              4.widthBox,
              Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 4),
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
            ],
          ),
        ),
      ),
    );
  }
}
