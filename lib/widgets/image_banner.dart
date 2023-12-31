import 'package:flutter/material.dart';
import 'package:tour_co/style.dart';

class ImageBanner extends StatelessWidget {
  final String assetPath;

  const ImageBanner(this.assetPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 370.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: startScreenButton,
            width: 12.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
