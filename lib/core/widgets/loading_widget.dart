
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final Color color;

  const LoadingWidget({required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: color));
  }
}
