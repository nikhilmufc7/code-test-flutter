import 'package:code_test_flutter/src/app/core/navigation/route_provider.dart';
import 'package:code_test_flutter/src/app/core/navigation/router_state.dart';
import 'package:code_test_flutter/src/app/core/navigation/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

///
/// This is the primary routing class that would be
/// exposed to internal and external modules.
///

final rootNavigatorKey = GlobalKey<NavigatorState>();

@singleton
class AppRouter {
  final List<RouteProvider> _providers;
  late final GoRouter delegate;

  AppRouter(this._providers) {
    delegate = GoRouter(
      routes: _providers.expand((provider) => provider.routes()).map((route) {
        final (path, builder) = route;
        return GoRoute(
          path: path,
          builder: (context, state) => builder(context, RouterState(state)),
        );
      }).toList(),
      initialLocation: Routes.home,
      navigatorKey: rootNavigatorKey,
    );
  }

  void navigate(BuildContext context, String routeName, {Object? extra}) =>
      context.push(routeName, extra: extra);
}
