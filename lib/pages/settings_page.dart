import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/gen/fonts.gen.dart';
import 'package:quest_phase/providers/settings_providers.dart';
import 'package:quest_phase/utils/font_utils.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppRichText('Settings', size: 24),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, child) {
                return SwitchListTile(
                  activeColor: Colors.orangeAccent,
                  title: const AppRichText('Keep On Screen', size: 20),
                  value: ref.watch(shouldKeepScreenOnProvider),
                  onChanged: (bool value) async => ref
                      .read(shouldKeepScreenOnProvider.notifier)
                      .update(value: value),
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                return SwitchListTile(
                  activeColor: Colors.orangeAccent,
                  title: const AppRichText('Reset Staging Threat', size: 20),
                  subtitle: const Text(
                    'Forced: During the refresh phase, set staging threat to 0',
                    style: TextStyle(fontFamily: FontFamily.timesNewRoman),
                  ),
                  value: ref.watch(shouldResetStagingThreatProvider),
                  onChanged: (bool value) async => ref
                      .read(shouldResetStagingThreatProvider.notifier)
                      .update(value: value),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
