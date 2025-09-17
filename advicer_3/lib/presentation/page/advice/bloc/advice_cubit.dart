import 'dart:math';

import 'package:advicer_3/domain/use_cases/advice_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceState> {
  AdviceCubit({required this.useCase}) : super(AdviceEmptyState());

  final AdviceUseCase useCase;

  void fetch() {
    emit(AdviceLoadingState());
    Future.delayed(Duration(seconds: 2), () async {
      final entity = await useCase.getAdvice();
      emit(AdviceLoadedState(advice: entity.advice));
    });
  }

  void fetchRandom(){
    final randomNumber = Random().nextInt(1000);
    emit(AdviceLoadingState());
    Future.delayed(Duration(seconds: 2), () => emit(AdviceLoadedState(advice: randomNumber.toString())));
  }
}
