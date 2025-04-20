import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, 
    required this.theme,
    required this.pageController,
    required this.duration,
    required this.curve,
  });

  final ThemeData theme;
  final PageController pageController;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: theme.colorScheme.primary,
      foregroundColor: theme.colorScheme.onPrimary,
      elevation: 2,
      shape: const CircleBorder(),
      onPressed: () {
        pageController.nextPage(
          duration: duration,
          curve: curve,
        );
      },
      child: const Icon(Icons.arrow_forward, size: 28),
    );
  }
}