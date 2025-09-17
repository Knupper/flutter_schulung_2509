import 'package:advicer_3/domain/entities/advice_entitiy.dart';
import 'package:multiple_result/multiple_result.dart';

import '../failures/failure.dart';

abstract class AdviceRepository{
  Future<Result<AdviceEntity, Failure>> read();
  Future<Result<AdviceEntity, Failure>> readById({required String id});
}

