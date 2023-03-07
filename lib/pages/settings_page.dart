import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/settings_providers.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings')
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, child) {
                return SwitchListTile(
                  title: const Text('Keep Screen On'),
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
                  title: const Text('Reset Staging Threat'),
                  subtitle: const Text('Set staging threat to 0 on new round.'),
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
