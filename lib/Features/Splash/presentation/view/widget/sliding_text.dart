import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slaidingAnimation,
  });

  final Animation<Offset> slaidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slaidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slaidingAnimation,
            child: const Text(
              textAlign: TextAlign.center,
              'Read Free Books',
            ),
          );
        });
  }
}
