import 'package:advicer_3/domain/entities/advice_entitiy.dart';
import 'package:advicer_3/domain/use_cases/advice_use_case.dart';
import 'package:advicer_3/presentation/page/advice/bloc/advice_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';

class MockAdviceUseCase extends Mock implements AdviceUseCase {}

void main() {
  group('AdviceCubit', () {
    group('should emit', () {
      late MockAdviceUseCase mockAdviceUseCase;

      setUp(() {
        mockAdviceUseCase = MockAdviceUseCase();
      });

      blocTest(
        'nothing if no method was called',
        build: () => AdviceCubit(useCase: mockAdviceUseCase),
        expect: () => const <AdviceState>[],
      );

      blocTest(
        '[AdviceLoadingState, AdviceLoadedState] if fetch was called',
        setUp: () async {
          when(
            () => mockAdviceUseCase.getAdvice(id: any(named: 'id')),
          ).thenAnswer((invocation) => Future.value(Result.success(AdviceEntity(advice: 'myTestAdvice42', id: ''))));
        },
        build: () => AdviceCubit(useCase: mockAdviceUseCase),
        act: (bloc) => bloc.fetch(),
        expect: () => <AdviceState>[AdviceLoadingState(), AdviceLoadedState(advice: 'myTestAdvice42')],
        verify: (_) => verify(() => mockAdviceUseCase.getAdvice()).called(1),
      );

      blocTest(
        '[AdviceLoadingState, AdviceLoadedState] if fetch was called with id',
        setUp: () async {},
        build: () => AdviceCubit(useCase: mockAdviceUseCase),
        act: (bloc) => bloc.fetch(id: '42'),
        expect: () => <AdviceState>[],
        verify: (_) => verify(() => mockAdviceUseCase.getAdvice()).called(1),
      );

      blocTest(
        '[AdviceLoadingState, AdviceErrorState] if fetch was called with invalid id',
        setUp: () async {},
        build: () => AdviceCubit(useCase: mockAdviceUseCase),
        act: (bloc) => bloc.fetch(id: 'aa'),
        expect: () => <AdviceState>[],
        verify: (_) => verify(() => mockAdviceUseCase.getAdvice()).called(1),
      );
    });
  });
}
