import 'package:flutter/material.dart';

class AdviceLoaded extends StatelessWidget {
  const AdviceLoaded({super.key, required this.advice});

  final String advice;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Text(advice, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
