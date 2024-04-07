import 'dart:math';

import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomFloatingActionButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.inversePrimary,
              Theme.of(context).colorScheme.secondaryContainer,
              Theme.of(context).colorScheme.tertiary,
              Theme.of(context).colorScheme.secondary,
            ],
            transform: const GradientRotation(pi / 4),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
