import 'package:code_test_flutter/src/app/core/navigation/app_router.dart';
import 'package:flutter/widgets.dart';

/// [AppRouterWidget] serves as a way to obtain
/// the [AppRouter] instance from the [BuildContext].
class AppRouterWidget extends InheritedWidget {
  final AppRouter appRouter;

  const AppRouterWidget({
    super.key,
    required this.appRouter,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant AppRouterWidget oldWidget) {
    return oldWidget.appRouter != appRouter;
  }

  static AppRouter of(BuildContext context) {
    final inheritedWidget =
        context.dependOnInheritedWidgetOfExactType<AppRouterWidget>();
    if (inheritedWidget == null) {
      throw Exception('AppRouterInherited not found in the context');
    }
    return inheritedWidget.appRouter;
  }
}
