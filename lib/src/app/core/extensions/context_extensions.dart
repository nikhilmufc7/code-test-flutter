import 'package:code_test_flutter/src/app/core/l10n/app_localizations.g.dart';
import 'package:flutter/material.dart';

extension BuildContextNavigation on BuildContext {
  AppLocalizations get translations => AppLocalizations.of(this)!;
}
