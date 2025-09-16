import 'package:flutter_bloc/flutter_bloc.dart';

part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceState> {
  AdviceCubit() : super(AdviceEmptyState());

  void fetch() {
    emit(AdviceLoadingState());
    Future.delayed(Duration(seconds: 2), () => emit(AdviceLoadedState()));
  }
}
