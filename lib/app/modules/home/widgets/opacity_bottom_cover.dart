import 'package:flutter/material.dart';

class OpacityBottomCover extends StatelessWidget {
  const OpacityBottomCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 50, // Altura do gradiente
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withValues(alpha: 0),
              Colors.white.withValues(alpha: 0.8),
            ],
          ),
        ),
      ),
    );
  }
}
