import 'package:code_test_flutter/src/app/core/gen/colors.gen.dart';
import 'package:code_test_flutter/src/app/core/gen/fonts.gen.dart';
import 'package:code_test_flutter/src/app/core/l10n/app_localizations.g.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  final RouterConfig<Object>? config;

  const MainApp({super.key, this.config});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: config,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        fontFamily: FontFamily.cabin,
        scaffoldBackgroundColor: ColorName.surface,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: ColorName.primary,
          onPrimary: ColorName.colorOnPrimary,
          primaryContainer: ColorName.primaryContainer,
          onSecondary: ColorName.colorOnSecondary,
          surface: ColorName.surface,
          onSurface: ColorName.colorOnSurface,
          secondary: ColorName.secondary,
        ),
      ),
    );
  }
}
