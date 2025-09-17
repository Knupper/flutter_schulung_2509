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
}
