import 'package:advicer_3/domain/entities/advice_entitiy.dart';
import 'package:advicer_3/domain/repositories/advice_repository.dart';

class AdviceUseCase{
  AdviceUseCase({required this.repository});

  final AdviceRepository repository;

  Future<AdviceEntity> getAdvice() async {
    // space for business logic
    return await repository.read();
  }
}