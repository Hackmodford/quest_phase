import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:quest_phase/pages/game_page.dart';
import 'package:quest_phase/pages/new_game_page.dart';
import 'package:quest_phase/pages/settings_page.dart';
import 'package:quest_phase/routes/route_constants.dart';

class AppRouter {
  static GoRouter create() {
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
