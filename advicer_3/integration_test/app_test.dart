import 'package:advicer_3/main.dart';
import 'package:advicer_3/presentation/page/advice/widget/advice_empty.dart';
import 'package:advicer_3/presentation/page/advice/widget/advice_loaded.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', (){
    testWidgets('fetch advice from backend', (widgetTester) async {
      await widgetTester.pumpWidget(MyApp());

      expect(find.byType(AdviceEmpty), findsOneWidget);

      await widgetTester.tap(find.text('fetch random data'));
      await widgetTester.pumpAndSettle(Duration(seconds: 1));
      expect(find.byType(AdviceLoaded), findsOneWidget);
    });
  });
}