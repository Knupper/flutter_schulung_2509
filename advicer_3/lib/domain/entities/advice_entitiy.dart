import 'package:equatable/equatable.dart';

class AdviceEntity with EquatableMixin{
  AdviceEntity({required this.advice, required this.id});
  final String advice;
  final String id;

  @override
  List<Object?> get props => [advice, id];
}