import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:quest_phase/pages/game_page.dart';
import 'package:quest_phase/pages/new_game_page/new_game_page.dart';
import 'package:quest_phase/pages/settings_page.dart';
import 'package:quest_phase/routes/route_constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'go_router_extensions.dart';

part 'app_router.g.dart';

@riverpod
GoRouter router(RouterRef ref) => AppRouter.build();

class AppRouter {
  static GoRouter build() {
    return GoRouter(
      routes: [
        GoRoute(
          name: RouteConstants.newGameRouteName,
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              const NewGamePage(),
        ),
        GoRoute(
          name: RouteConstants.gameRouteName,
          path: '/game',
          builder: (BuildContext context, GoRouterState state) =>
              const GamePage(),
          routes: [
            GoRoute(
              name: RouteConstants.settingsRouteName,
              path: 'settings',
              builder: (BuildContext context, GoRouterState state) =>
                  const SettingsPage(),
            ),
          ],
        ),
      ],
    );
  }
}
