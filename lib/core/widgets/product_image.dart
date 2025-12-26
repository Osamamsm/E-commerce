import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
  });

  final String imageUrl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
