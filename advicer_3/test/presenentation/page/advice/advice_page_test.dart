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
import 'package:mocktail/mocktail.dart';

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
    late AdviceCubit mockCubit;

    setUp(() {
      mockCubit = MockAdviceCubit();
    });

    group('should react on button click', () {
      testWidgets('and show text field is required', (widgetTester) async {
        whenListen(mockCubit, Stream.fromIterable([AdviceEmptyState()]), initialState: AdviceEmptyState());
        await widgetTester.pumpWidget(createWidgetUnderTest(cubit: mockCubit));

        await widgetTester.pumpAndSettle();

        await widgetTester.tap(find.text('fetch data'));

        await widgetTester.pumpAndSettle();
        
        final errorMessage = find.text('Required field, please enter a number');
        
        expect(errorMessage, findsOneWidget);
      });

      testWidgets('and show text field is invalid number', (widgetTester) async {
        whenListen(mockCubit, Stream.fromIterable([AdviceEmptyState()]), initialState: AdviceEmptyState());
        await widgetTester.pumpWidget(createWidgetUnderTest(cubit: mockCubit));

        await widgetTester.pumpAndSettle();
        
        await widgetTester.enterText(find.byKey(Key('id_input')), 'asd');

        await widgetTester.tap(find.text('fetch data'));

        await widgetTester.pumpAndSettle();

        final errorMessage = find.text('Only digits are allowed');

        expect(errorMessage, findsOneWidget);
      });


      testWidgets('and calls fetch from AdviceCubit if form is valid', (widgetTester) async {
        when(() => mockCubit.fetch(id: '12')).thenAnswer((invocation) => Future.value(),);
        whenListen(mockCubit, Stream.fromIterable([AdviceEmptyState()]), initialState: AdviceEmptyState());
        await widgetTester.pumpWidget(createWidgetUnderTest(cubit: mockCubit));

        await widgetTester.pumpAndSettle();

        await widgetTester.enterText(find.byKey(Key('id_input')), '12');

        await widgetTester.tap(find.text('fetch data'));

        await widgetTester.pumpAndSettle();

        verify(() => mockCubit.fetch(id: '12')).called(1);
      });

    });

    group('should be displayed in ViewState', () {


      testWidgets('AdviceEmpty widget is displayed on AdviceEmptyState', (widgetTester) async {
        whenListen(mockCubit, Stream.fromIterable([AdviceEmptyState()]), initialState: AdviceEmptyState());

        await widgetTester.pumpWidget(createWidgetUnderTest(cubit: mockCubit));

        await widgetTester.pumpAndSettle();

        final emptyWidget = find.byType(AdviceEmpty);
        final emptyKey = find.byKey(Key(AdviceEmpty.adviceEmptyKey));
        final emptyText = find.text('Empty State');

        expect(emptyWidget, findsOneWidget);
        expect(emptyKey, findsOneWidget);
        expect(emptyText, findsOneWidget);
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
