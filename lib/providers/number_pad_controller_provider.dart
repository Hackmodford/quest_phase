import 'package:quest_phase/controllers/number_pad_controller.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'number_pad_controller_provider.g.dart';

@riverpod
NumberPadController numberPadController(NumberPadControllerRef ref) => NumberPadController(ref);