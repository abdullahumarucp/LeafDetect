import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget
      child; // Child widget to display on top of the gradient background

  const GradientBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft, // Start point of the gradient
          end: Alignment.bottomRight, // End point of the gradient
          colors: [
            // Light color
            Color.fromARGB(255, 153, 232, 156),
            Color.fromARGB(255, 239, 244, 241), // Medium green
            Color.fromARGB(255, 46, 114, 48), // Dark green
          ],
          stops: [0.0, 0.5, 1.0], // Adjust the stops for smooth transitions
        ),
      ),
      child: child, // Display the child widget on top of the gradient
    );
  }
}