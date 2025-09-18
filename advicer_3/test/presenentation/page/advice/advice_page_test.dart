import 'package:advicer_3/domain/failures/failure.dart';
import 'package:advicer_3/presentation/page/advice/advice_page.dart';
import 'package:advicer_3/presentation/page/advice/bloc/advice_cubit.dart';
import 'package:advicer_3/presentation/page/advice/widget/advice_empty.dart';
import 'package:advicer_3/presentation/page/advice/widget/advice_error.dart';
import 'package:advicer_3/presentation/page/advice/widget/advice_loaded.dart';
import 'package:advicer_3/presentation/page/advice/widget/advice_loading.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAdviceCubit extends MockCubit<AdviceState> implements AdviceCubit {}

void main() {
  Widget createWidgetUnderTest({required AdviceCubit cubit}) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider<AdviceCubit>(create: (context) => cubit, child: AdvicePageInternal()),
      ),
    );
  }

  group('AdvicePage', () {
    group('should be displayed in ViewState', () {
      late AdviceCubit mockCubit;

      setUp(() {
        mockCubit = MockAdviceCubit();
      });

      testWidgets('AdviceEmpty widget is displayed on AdviceEmptyState', (widgetTester) async {
        whenListen(mockCubit, Stream.fromIterable([AdviceEmptyState()]), initialState: AdviceEmptyState());

        await widgetTester.pumpWidget(createWidgetUnderTest(cubit: mockCubit));

        await widgetTester.pumpAndSettle();

        final emptyWidget = find.byType(AdviceEmpty);
        // final emptyText = find.text('Empty State');

        expect(emptyWidget, findsOneWidget);
      });

      testWidgets('AdviceLoading widget is displayed on AdviceLoadingState', (widgetTester) async {
        whenListen(mockCubit, Stream.fromIterable([AdviceLoadingState()]), initialState: AdviceLoadingState());

        await widgetTester.pumpWidget(createWidgetUnderTest(cubit: mockCubit));

        await widgetTester.pump();

        final loadingWidget = find.byType(AdviceLoading);

        expect(loadingWidget, findsOneWidget);
      });

      testWidgets('AdviceError widget is displayed on AdviceErrorState', (widgetTester) async {
        whenListen(
          mockCubit,
          Stream.fromIterable([AdviceErrorState(failure: UnknownFailure())]),
          initialState: AdviceErrorState(failure: UnknownFailure()),
        );

        await widgetTester.pumpWidget(createWidgetUnderTest(cubit: mockCubit));

        await widgetTester.pumpAndSettle();

        final errorWidget = find.byType(AdviceError);

        expect(errorWidget, findsOneWidget);
      });

      testWidgets('AdviceLoaded widget is displayed on AdviceLoadedState', (widgetTester) async {
        whenListen(
          mockCubit,
          Stream.fromIterable([AdviceLoadedState(advice: 'advice')]),
          initialState: AdviceLoadedState(advice: 'advice'),
        );

        await widgetTester.pumpWidget(createWidgetUnderTest(cubit: mockCubit));

        await widgetTester.pumpAndSettle();

        final loadedWidget = find.byType(AdviceLoaded);

        expect(loadedWidget, findsOneWidget);
      });
    });
  });
}
