import 'package:go_router/go_router.dart';
import 'package:quest_phase/routes/route_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter router(RouterRef ref) => AppRouter.build();

