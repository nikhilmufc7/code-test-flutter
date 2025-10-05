import 'package:code_test_flutter/src/app/core/navigation/app_router.dart';
import 'package:code_test_flutter/src/app/core/navigation/app_router_widget.dart';
import 'package:code_test_flutter/src/app/app_view.dart';
import 'package:code_test_flutter/src/app/core/inject/app_injector.dart';
import 'package:flutter/material.dart';

class EntryPoint extends StatelessWidget {
  final AppRouter router = getIt();

  @override
  Widget build(BuildContext context) {
    return AppRouterWidget(
      appRouter: router,
      child: MainApp(config: router.delegate),
    );
  }
}
