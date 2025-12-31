import 'package:e_commerce/core/widgets/product_image.dart';
import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({
    super.key,
    required this.controller,
    required this.index,
    required this.activeIndex,
    required this.imageUrl,
    required this.onTap,
    required this.maxHeight,
  });

  final PageController controller;
  final int index;
  final int activeIndex;
  final String imageUrl;
  final VoidCallback onTap;
  final double maxHeight;

  static const double _minHeight = 260;
  static const double _scaleReduction = 0.12;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final double page = controller.hasClients && controller.page != null
            ? controller.page!
            : activeIndex.toDouble();

        final double distance = (page - index).abs().clamp(0.0, 1.0);

        final double scale = 1.0 - (distance * _scaleReduction);

        final double height = maxHeight - (distance * (maxHeight - _minHeight));

        return Center(
          child: GestureDetector(
            onTap: onTap,
            child: SizedBox(
              height: height,
              child: Transform.scale(scale: scale, child: child),
            ),
          ),
        );
      },
      child: ProductImage(
        imageUrl: imageUrl,
        height: maxHeight,
        width: double.infinity,
      ),
    );
  }
}
