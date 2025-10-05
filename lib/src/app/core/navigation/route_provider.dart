import 'package:code_test_flutter/src/app/core/navigation/router_state.dart';
import 'package:flutter/widgets.dart';

typedef RouteBuilder = Widget Function(
  BuildContext context,
  RouterState params,
);

///
/// [RouteProvider] allows multiple modules to contribute to the navigation graph.
/// Multiple route providers would then be collated to get the final routes.
/// This facilitates the separation of concerns and allows for better code organization.
///
abstract class RouteProvider {
  Iterable<(String, RouteBuilder)> routes();
}
