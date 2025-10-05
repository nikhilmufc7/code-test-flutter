import 'package:code_test_flutter/src/app/core/navigation/route_provider.dart';
import 'package:code_test_flutter/src/app/core/navigation/main_route_provider.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @lazySingleton
  List<RouteProvider> routeProviders() {
    return [MainRouteProvider()];
  }
}
