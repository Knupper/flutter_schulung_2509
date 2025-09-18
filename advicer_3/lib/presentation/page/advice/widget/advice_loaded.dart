import 'package:flutter/material.dart';

class AdviceLoaded extends StatelessWidget {
  const AdviceLoaded({super.key, required this.advice});

  final String advice;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      hint: 'Advice Loaded',
      enabled: true,
      label: 'AdviceCard',
      child: Card(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: SelectableText(advice, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
