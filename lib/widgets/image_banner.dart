import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  final String assetPath;

  const ImageBanner(this.assetPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 370.0),
      decoration: const BoxDecoration(color: Color.fromARGB(255, 19, 229, 248)),
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
