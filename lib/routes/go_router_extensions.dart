import 'package:go_router/go_router.dart';
import 'package:quest_phase/routes/route_constants.dart';

extension GoRouterExtensions on GoRouter {
  void goToNewGame() => goNamed(RouteConstants.newGameRouteName);
  void goToSettings() => goNamed(RouteConstants.settingsRouteName);
  void goToGame() => goNamed(RouteConstants.gameRouteName);
}
