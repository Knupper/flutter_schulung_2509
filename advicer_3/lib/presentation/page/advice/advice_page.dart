import 'package:advicer_3/presentation/page/advice/bloc/advice_cubit.dart';
import 'package:advicer_3/presentation/page/advice/widget/advice_empty.dart';
import 'package:advicer_3/presentation/page/advice/widget/advice_error.dart';
import 'package:advicer_3/presentation/page/advice/widget/advice_loaded.dart';
import 'package:advicer_3/presentation/page/advice/widget/advice_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdvicePage extends StatelessWidget{
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Advicer App')),
      body: BlocProvider(create: (context) => AdviceCubit(), child: _AdvicePage(),),
    );
  }
}

// Aufgabe
// AdviceLoadedState mit geladenen Daten ergänzen -> bei fetch sollte das immer einheitlich "Advice" sein
// Diese Daten in der UI anzeigen
// Zweiten Button einbaut
// der eine Methode fetchRandom im cubit aufruft und eine Random zahl zurück gibt
// var intValue = Random().nextInt(10); // Value is >= 0 and < 10.


class _AdvicePage extends StatelessWidget {
  const _AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(64),
      child: Column(
        children: [
          Center(child: BlocBuilder<AdviceCubit, AdviceState>(
            builder: (context, state) {
              switch(state){
                case AdviceEmptyState():
                  return AdviceEmpty();
                case AdviceLoadingState():
                  return AdviceLoading();
                case AdviceErrorState():
                  return AdviceError();
                case AdviceLoadedState():
                  return AdviceLoaded(advice: state.advice);
              }
          },),),
          BlocBuilder<AdviceCubit, AdviceState>(
            // buildWhen: (previous, current) => previous is AdviceEmptyState && current is AdviceLoadingState, // can be used to reduce ui rebuilds
            builder: (context, state) {
              final isLoading = state is AdviceLoadingState;
              return Column(
                children: [
                  ElevatedButton(onPressed: isLoading ? null : () => BlocProvider.of<AdviceCubit>(context).fetch(), child: Text('fetch data')),
                  ElevatedButton(onPressed: isLoading ? null : () => BlocProvider.of<AdviceCubit>(context).fetchRandom(), child: Text('fetch random data')),
                ],
              );
            },),
        ],
      ),
    );
  }
}
