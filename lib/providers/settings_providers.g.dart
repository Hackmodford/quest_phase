// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPreferencesHash() => r'75e745127707e465d3f55ce89ddcc932bd72bc2d';

/// See also [sharedPreferences].
@ProviderFor(sharedPreferences)
final sharedPreferencesProvider = Provider<SharedPreferences>.internal(
  sharedPreferences,
  name: r'sharedPreferencesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedPreferencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SharedPreferencesRef = ProviderRef<SharedPreferences>;
String _$shouldResetStagingThreatHash() =>
    r'47956392a9a8c3e02210173ace72ba39aaf479c5';

/// See also [ShouldResetStagingThreat].
@ProviderFor(ShouldResetStagingThreat)
final shouldResetStagingThreatProvider =
    AutoDisposeNotifierProvider<ShouldResetStagingThreat, bool>.internal(
  ShouldResetStagingThreat.new,
  name: r'shouldResetStagingThreatProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shouldResetStagingThreatHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShouldResetStagingThreat = AutoDisposeNotifier<bool>;
String _$shouldKeepScreenOnHash() =>
    r'6ad70432083f4c577e1d0102ec97cb915519749a';

/// See also [ShouldKeepScreenOn].
@ProviderFor(ShouldKeepScreenOn)
final shouldKeepScreenOnProvider =
    AutoDisposeNotifierProvider<ShouldKeepScreenOn, bool>.internal(
  ShouldKeepScreenOn.new,
  name: r'shouldKeepScreenOnProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shouldKeepScreenOnHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShouldKeepScreenOn = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
