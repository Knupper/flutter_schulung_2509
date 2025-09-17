import 'dart:math';

import 'package:advicer_3/domain/use_cases/advice_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceState> {
  AdviceCubit({required this.useCase}) : super(AdviceEmptyState());

  final AdviceUseCase useCase;

  void fetch({String? id}) {
    emit(AdviceLoadingState());
    Future.delayed(Duration(seconds: 2), () async {
      final entity = await useCase.getAdvice(id: id);
      emit(AdviceLoadedState(advice: entity.advice));
    });
  }
}
