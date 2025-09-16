part of 'advice_cubit.dart';
sealed class AdviceState {
  const AdviceState();
}

class AdviceEmptyState extends AdviceState{}

class AdviceLoadingState extends AdviceState{}

class AdviceErrorState extends AdviceState{}

class AdviceLoadedState extends AdviceState{
  final String advice;

  AdviceLoadedState({required this.advice});
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