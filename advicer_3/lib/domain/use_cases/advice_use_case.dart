import 'package:advicer_3/domain/entities/advice_entitiy.dart';
import 'package:advicer_3/domain/repositories/advice_repository.dart';

class AdviceUseCase{
  AdviceUseCase({required this.repository});

  final AdviceRepository repository;

  Future<AdviceEntity> getAdvice({String? id}) async {
    // We can validate if id is a valid int or some other id logic here

    if(id == null){
      return await repository.read();
    } else {
      // space for business logic
      return await repository.readById(id: id);
    }
  }
}