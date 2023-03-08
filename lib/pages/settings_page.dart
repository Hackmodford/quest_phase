import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/gen/fonts.gen.dart';
import 'package:quest_phase/providers/settings_providers.dart';
import 'package:quest_phase/utils/font_utils.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: buildRichText("Settings", 24),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, child) {
                return SwitchListTile(
                  title: buildRichText("Keep On Screen", 20),
                  value: ref.watch(settingShouldKeepScreenOnProvider),
                  onChanged: (bool value) => ref
                      .read(settingShouldKeepScreenOnProvider.notifier)
                      .update(value),
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                return SwitchListTile(
                  title: buildRichText("Reset Staging Threat", 20),
                  subtitle: const Text(
                    'Forced: During the refresh phase, set staging threat to 0',
                    style: TextStyle(fontFamily: FontFamily.timesNewRoman),
                  ),
                  value: ref.watch(settingShouldResetStagingThreatProvider),
                  onChanged: (bool value) => ref
                      .read(settingShouldResetStagingThreatProvider.notifier)
                      .update(value),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
