import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceState> {
  AdviceCubit() : super(AdviceEmptyState());

  void fetch() {
    emit(AdviceLoadingState());
    Future.delayed(Duration(seconds: 2), () => emit(AdviceLoadedState(advice: 'advice')));
  }

  void fetchRandom(){
    final randomNumber = Random().nextInt(1000);
    emit(AdviceLoadingState());
    Future.delayed(Duration(seconds: 2), () => emit(AdviceLoadedState(advice: randomNumber.toString())));
  }
}
