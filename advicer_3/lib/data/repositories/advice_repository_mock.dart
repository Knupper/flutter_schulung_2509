import 'dart:math';

import 'package:advicer_3/domain/entities/advice_entitiy.dart';
import 'package:advicer_3/domain/repositories/advice_repository.dart';

class AdviceRepositoryMock implements AdviceRepository {
  final List<AdviceEntity> _dummyData = List.generate(
    100,
    (index) => AdviceEntity(advice: 'advice $index', id: index.toString()),
  );

  @override
  Future<AdviceEntity> read() {
    final randomIndex = Random().nextInt(10);

    return Future.value(_dummyData[randomIndex]);
  }

  @override
  Future<AdviceEntity> readById({required String id}) {
    final parsedInt = int.tryParse(id);
    if(parsedInt == null){
      // TODO return failure
      return Future.value(AdviceEntity(id: '-1', advice: 'FEHLER'));
    }

    if(parsedInt < _dummyData.length){
      // TODO return failure
    }

    return Future.value(_dummyData[parsedInt]);
  }
}
