import 'dart:async';

import 'package:code_test_flutter/src/app/app_entry_point.dart';
import 'package:flutter/material.dart';
import 'package:code_test_flutter/src/app/core/inject/app_injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(EntryPoint());
}
