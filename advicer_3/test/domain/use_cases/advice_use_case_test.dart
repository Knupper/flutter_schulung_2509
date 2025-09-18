import 'package:advicer_3/domain/entities/advice_entitiy.dart';
import 'package:advicer_3/domain/failures/failure.dart';
import 'package:advicer_3/domain/repositories/advice_repository.dart';
import 'package:advicer_3/domain/use_cases/advice_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';

class MockAdviceRepository extends Mock implements AdviceRepository {}

void main() {
  group('AdviceUseCase', () {
    group('returns AdviceEntity', () {
      late MockAdviceRepository mockAdviceRepository;

      setUp(() {
        mockAdviceRepository = MockAdviceRepository();
      });

      test('if read was called', () async {
        // setup
        when(
          () => mockAdviceRepository.read(),
        ).thenAnswer((invocation) => Future.value(Result.success(AdviceEntity(id: '2', advice: '22'))));

        //create
        final useCaseUnderTest = AdviceUseCase(repository: mockAdviceRepository);

        // act
        final result = await useCaseUnderTest.getAdvice();

        // expect/ verify
        expect(result.isSuccess(), true);
        expect(result.isError(), false);
        expect(result, Result<AdviceEntity, Failure>.success(AdviceEntity(id: '2', advice: '22')));

        verify(() => mockAdviceRepository.read()).called(1);
        verifyNoMoreInteractions(mockAdviceRepository);
      });

      test('if readBy was called', () async {
        // setup
        when(
          () => mockAdviceRepository.readById(id: '22'),
        ).thenAnswer((invocation) => Future.value(Result.success(AdviceEntity(id: '2', advice: '22'))));

        //create
        final useCaseUnderTest = AdviceUseCase(repository: mockAdviceRepository);

        // act
        final result = await useCaseUnderTest.getAdvice(id: '22');

        // expect/ verify
        expect(result.isSuccess(), true);
        expect(result.isError(), false);
        expect(result, Result<AdviceEntity, Failure>.success(AdviceEntity(id: '2', advice: '22')));

        verify(() => mockAdviceRepository.readById(id: '22')).called(1);
        verifyNoMoreInteractions(mockAdviceRepository);
      });
    });

    group('returns Failure', () {
      test('if read was called and we got an error', () {}, skip: true);
      test('if readBy was called and we got an error', () {}, skip: true);
    });
  });
}
