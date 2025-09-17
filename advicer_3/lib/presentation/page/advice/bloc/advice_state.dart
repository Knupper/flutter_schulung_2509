part of 'advice_cubit.dart';

sealed class AdviceState with EquatableMixin {
  const AdviceState();

  @override
  List<Object?> get props => [];
}

class AdviceEmptyState extends AdviceState {
  const AdviceEmptyState();
}

class AdviceLoadingState extends AdviceState {
  const AdviceLoadingState();
}

class AdviceErrorState extends AdviceState {
  AdviceErrorState({required this.failure});

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}

class AdviceLoadedState extends AdviceState {
  final String advice;

  AdviceLoadedState({required this.advice});

  @override
  List<Object?> get props => [advice];
}

// class AlternativeAdviceState {
//   final AdviceUiState uiState;
//   final String? advice;
//   final String? error;
//
//   AlternativeAdviceState({required this.uiState, required this.advice, required this.error});
// }
//
// enum AdviceUiState{
//   loading, error, loaded, empty,
// }
