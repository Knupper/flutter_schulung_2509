import 'dart:math';

import 'package:advicer_3/domain/entities/advice_entitiy.dart';
import 'package:advicer_3/domain/failures/failure.dart';
import 'package:advicer_3/domain/repositories/advice_repository.dart';
import 'package:multiple_result/multiple_result.dart';

class AdviceRepositoryMock implements AdviceRepository {
  final List<AdviceEntity> _dummyData = List.generate(
    100,
    (index) => AdviceEntity(advice: 'advice $index', id: index.toString()),
  );

  @override
  Future<Result<AdviceEntity, Failure>> read() {
    final randomIndex = Random().nextInt(10);

    return Future.value(Result.success(_dummyData[randomIndex]));
  }

  @override
  Future<Result<AdviceEntity, Failure>> readById({required String id}) {
    final parsedInt = int.tryParse(id);
    if(parsedInt == null){
      return Future.value(Result.error(InvalidInputFailure()));
    }

    if(parsedInt < _dummyData.length){
      return Future.value(Result.error(OutOfBounceFailure()));
    }

    return Future.value(Result.success(_dummyData[parsedInt]));
  }
}
