import 'package:e_commerce/features/product_details/presentation/widgets/carousel_item.dart';
import 'package:flutter/material.dart';

class ProductImagesCarouselView extends StatefulWidget {
  const ProductImagesCarouselView({super.key, required this.productImages});

  final List<String> productImages;

  @override
  State<ProductImagesCarouselView> createState() =>
      _ProductImagesCarouselViewState();
}

class _ProductImagesCarouselViewState extends State<ProductImagesCarouselView> {
  late final PageController _pageController;

  int _activeIndex = 0;

  static const double _viewportFraction = 0.55;
  static const double _maxItemHeight = 280;
  static const Duration _animationDuration = Duration(milliseconds: 350);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: _viewportFraction);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _maxItemHeight,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.productImages.length,
        onPageChanged: (index) {
          setState(() => _activeIndex = index);
        },
        itemBuilder: (context, index) {
          return CarouselItem(
            controller: _pageController,
            index: index,
            activeIndex: _activeIndex,
            imageUrl: widget.productImages[index],
            onTap: () => _animateTo(index),
            maxHeight: _maxItemHeight,
          );
        },
      ),
    );
  }

  void _animateTo(int index) {
    _pageController.animateToPage(
      index,
      duration: _animationDuration,
      curve: Curves.easeOutCubic,
    );
  }
}
