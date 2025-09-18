import 'package:advicer_3/domain/failures/failure.dart';
import 'package:advicer_3/domain/repositories/advice_repository.dart';
import 'package:advicer_3/domain/use_cases/advice_use_case.dart';
import 'package:advicer_3/presentation/page/advice/bloc/advice_cubit.dart';
import 'package:advicer_3/presentation/page/advice/widget/advice_empty.dart';
import 'package:advicer_3/presentation/page/advice/widget/advice_error.dart';
import 'package:advicer_3/presentation/page/advice/widget/advice_loaded.dart';
import 'package:advicer_3/presentation/page/advice/widget/advice_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Advicer App')),
      body: BlocProvider(
        create: (context) =>
            AdviceCubit(useCase: AdviceUseCase(repository: RepositoryProvider.of<AdviceRepository>(context))),
        child: AdvicePageInternal(),
      ),
    );
  }
}

// Aufgabe
// AdviceLoadedState mit geladenen Daten ergänzen -> bei fetch sollte das immer einheitlich "Advice" sein
// Diese Daten in der UI anzeigen
// Zweiten Button einbaut
// der eine Methode fetchRandom im cubit aufruft und eine Random zahl zurück gibt
// var intValue = Random().nextInt(10); // Value is >= 0 and < 10.

// Aufgabe 2
// der fetch random data button soll ein zufälliges element zurück geben
// der fetch 42 button soll immer das element mit der id 42 zurück geben

// Aufgabe 3
// Baut ein TextField (https://api.flutter.dev/flutter/material/TextField-class.html)
// Die vom Nutzer eingegebene Zahl auslesen
// fetch 42 aufruft, das dann die eingegebene Zahl genutzt wird
class AdvicePageInternal extends StatefulWidget {
  @visibleForTesting
  const AdvicePageInternal({super.key});

  @override
  State<AdvicePageInternal> createState() => _AdvicePageInternalState();
}

class _AdvicePageInternalState extends State<AdvicePageInternal> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(64),
      child: Column(
        children: [
          Center(
            child: BlocBuilder<AdviceCubit, AdviceState>(
              builder: (context, state) {
                switch (state) {
                  case AdviceEmptyState():
                    return AdviceEmpty(key: Key(AdviceEmpty.adviceEmptyKey));
                  case AdviceLoadingState():
                    return AdviceLoading();
                  case AdviceErrorState():
                    return AdviceError(failure: UnknownFailure());
                  case AdviceLoadedState():
                    return AdviceLoaded(advice: state.advice);
                }
              },
            ),
          ),
          Form(
            key: _formKey,
            child: BlocBuilder<AdviceCubit, AdviceState>(
              // buildWhen: (previous, current) => previous is AdviceEmptyState && current is AdviceLoadingState, // can be used to reduce ui rebuilds
              builder: (context, state) {
                final isLoading = state is AdviceLoadingState;
                return Column(
                  children: [
                    ElevatedButton(
                      onPressed: isLoading ? null : () => BlocProvider.of<AdviceCubit>(context).fetch(),
                      child: Text('fetch random data'),
                    ),
                    TextFormField(
                      key: Key('id_input'),
                      controller: _textEditingController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required field, please enter a number';
                        }

                        if (int.tryParse(value) == null) {
                          return 'Only digits are allowed';
                        }

                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              final isValid = _formKey.currentState?.validate() == true;

                              if (isValid) {
                                BlocProvider.of<AdviceCubit>(context).fetch(id: _textEditingController.value.text);
                              }
                            },
                      child: Text('fetch data'),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
