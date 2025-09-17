import 'package:advicer_3/domain/entities/advice_entitiy.dart';

abstract class AdviceRepository{
  Future<AdviceEntity> read();
}

