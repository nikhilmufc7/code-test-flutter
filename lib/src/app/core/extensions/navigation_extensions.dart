import 'package:code_test_flutter/src/app/core/navigation/app_router_widget.dart';
import 'package:flutter/material.dart';

extension BuildContextNavigation on BuildContext {
  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop(result);

  void navigate(String routeName, {Object? extra}) =>
      AppRouterWidget.of(this).navigate(this, routeName, extra: extra);
}
