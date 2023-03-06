import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/pages/game_page.dart';
import 'package:quest_phase/pages/new_game_page.dart';
import 'package:quest_phase/pages/settings_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const NewGamePage(),
      ),
      GoRoute(
        path: '/game',
        builder: (BuildContext context, GoRouterState state) =>
            const GamePage(),
        routes: [
          GoRoute(
            path: 'settings',
            builder: (BuildContext context, GoRouterState state) =>
                const SettingsPage(),
          ),
        ],
      ),
    ],
  );
});
