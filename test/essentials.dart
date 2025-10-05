import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import "package:path/path.dart" show dirname;
import 'package:code_test_flutter/src/app/core/utils/logging.dart' as l;
import 'package:test/test.dart';

const sourceFileKey = "SF:";
const linesFoundKey = "LF:";
const linesHitKey = "LH:";

const minCoverage = 80;
const modulesCovered = ["blocs", "services"];
const modulesIgnored = <String>[];

void main() async {
  final path =
      Uri.parse('${dirname(Platform.script.toString())}/coverage/lcov.info');

  test("Code Coverage", () async {
    bool includedFile = false;
    int linesFound = 0;
    int linesHit = 0;

    await File.fromUri(path)
        .openRead()
        .transform(utf8.decoder) // Decode bytes to UTF-8.
        .transform(LineSplitter()) // Convert stream to individual lines.
        .listen((String line) {
      if (line.startsWith(sourceFileKey)) {
        includedFile = modulesIgnored.none((module) => line.contains(module)) &&
            modulesCovered.any((module) => line.contains(module));
      } else if (line.startsWith(linesFoundKey) && includedFile) {
        linesFound += int.parse(line.replaceFirst(linesFoundKey, ""));
      } else if (line.startsWith(linesHitKey) && includedFile) {
        linesHit += int.parse(line.replaceFirst(linesHitKey, ""));
      }
    }).asFuture<void>();

    final actualCoverage = (linesHit.toDouble() / linesFound.toDouble()) * 100;
    final log =
        "Expected Coverage: $minCoverage%, Actual Coverage: $actualCoverage%";
    l.log(message: log);
    expect(actualCoverage, greaterThanOrEqualTo(minCoverage));
  });
}
