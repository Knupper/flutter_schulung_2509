import 'package:advicer_3/domain/failures/failure.dart';
import 'package:advicer_3/domain/use_cases/advice_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceState> {
  AdviceCubit({required this.useCase}) : super(AdviceEmptyState());

  final AdviceUseCase useCase;

  Future<void> fetch({String? id}) async {
    emit(AdviceLoadingState());
    final entity = await useCase.getAdvice(id: id);

    entity.map(
      successMapper: (success) => emit(AdviceLoadedState(advice: success.advice)),
      errorMapper: (error) => emit(AdviceErrorState(failure: error)),
    );
  }
}
