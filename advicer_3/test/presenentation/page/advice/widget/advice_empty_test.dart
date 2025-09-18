import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget createWidgetUnderTest({required Widget child}) {
  return MaterialApp(home: Scaffold(body: child));
}

void main() {
  group('AdviceEmpty', () {
  });
}
