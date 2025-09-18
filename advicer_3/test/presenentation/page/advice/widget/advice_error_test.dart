import 'dart:typed_data';

import 'package:advicer_3/domain/failures/failure.dart';
import 'package:advicer_3/presentation/page/advice/bloc/advice_cubit.dart';
import 'package:advicer_3/presentation/page/advice/widget/advice_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

Widget createWidgetUnderTest({required Widget child}) {
  return MaterialApp(home: Scaffold(body: child));
}

// oder packages verwenden wie https://pub.dev/packages/alchemist
void main() {
  group('AdviceError', () {
    group('GoldenTests', () {

      testWidgets('check', (widgetTester) async {
        // final Future<ByteData> font = rootBundle.load('path/to/font-file/Roboto.ttf');

        // final FontLoader fontLoader = FontLoader('Roboto')..addFont(font);
        // await fontLoader.load();

        await widgetTester.pumpWidget(createWidgetUnderTest(child: AdviceError(failure: UnknownFailure(),)));

        await expectLater(find.byType(AdviceError), matchesGoldenFile('golden/advice_error.png'));
      }, tags: 'golden');
    });
  });
}
