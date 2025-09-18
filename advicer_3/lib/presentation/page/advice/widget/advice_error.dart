import 'package:advicer_3/domain/failures/failure.dart';
import 'package:flutter/material.dart';

class AdviceError extends StatelessWidget {
  const AdviceError({super.key, required this.failure});

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red, child: Text('Error: failure.toString()'));
  }
}
