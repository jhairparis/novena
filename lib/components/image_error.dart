import 'package:flutter/material.dart';

class ImageError extends StatelessWidget {
  final double? width;
  final double? height;

  const ImageError({
    super.key,
    this.width = 120,
    this.height = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Ink.image(
      image: const AssetImage("assets/img/placeholder.webp"),
      fit: BoxFit.cover,
      width: width,
      height: height,
    );
  }
}
