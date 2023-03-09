import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/routes/route_config.dart';

final routerProvider = Provider<GoRouter>((ref) => AppRouter.create());
