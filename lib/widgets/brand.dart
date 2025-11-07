import 'package:flutter/material.dart';

class BrandLogo extends StatelessWidget {
  final double size;
  const BrandLogo({super.key, this.size = 48});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo.png',
      width: size,
      height: size,
      errorBuilder: (context, error, stackTrace) {
        // Fallback to text if asset not present yet
        return Text(
          'JAWJI',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Colors.white,
                fontSize: size * 0.8,
                letterSpacing: 2,
              ),
        );
      },
    );
  }
}

