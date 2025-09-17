import 'package:advicer_3/data/repositories/advice_repository_mock.dart';
import 'package:advicer_3/domain/repositories/advice_repository.dart';
import 'package:advicer_3/presentation/page/advice/advice_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AdviceRepository>(
      create: (context) => AdviceRepositoryMock(),
      child: MaterialApp(home: AdvicePage()),
    );
  }
}
