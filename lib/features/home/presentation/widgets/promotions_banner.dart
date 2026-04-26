import 'dart:async';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/product/data/models/promotion.dart';
import 'package:flutter/material.dart';

class PromotionsBanner extends StatefulWidget {
  final List<Promotion> promotions;
  final void Function(Promotion promotion)? onTap;
  final Duration autoScrollDuration;

  const PromotionsBanner({
    super.key,
    required this.promotions,
    this.onTap,
    this.autoScrollDuration = const Duration(seconds: 4),
  });

  @override
  State<PromotionsBanner> createState() => _PromotionsBannerState();
}

class _PromotionsBannerState extends State<PromotionsBanner> {
  late final PageController _pageController;
  int _currentIndex = 0;
  Timer? _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    if (widget.promotions.length <= 1) return;
    _autoScrollTimer = Timer.periodic(widget.autoScrollDuration, (_) {
      if (!mounted) return;
      final next = (_currentIndex + 1) % widget.promotions.length;
      _pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.promotions.isEmpty) return const SizedBox.shrink();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 160,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.promotions.length,
            onPageChanged: (i) => setState(() => _currentIndex = i),
            itemBuilder: (context, index) {
              return _PromotionCard(
                promotion: widget.promotions[index],
                onTap: widget.onTap != null
                    ? () => widget.onTap!(widget.promotions[index])
                    : null,
              );
            },
          ),
        ),
        if (widget.promotions.length > 1) ...[
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.promotions.length, (i) {
              final isActive = i == _currentIndex;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: isActive ? 22 : 6,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: isActive ? const Color(0xFF7C3AED) : Colors.white24,
                ),
              );
            }),
          ),
        ],
      ],
    );
  }
}

class _PromotionCard extends StatelessWidget {
  final Promotion promotion;
  final VoidCallback? onTap;

  const _PromotionCard({required this.promotion, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            colors: const [Color(0xFF7C3AED), Color(0xFF4C1D95)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (promotion.imageUrl != null)
              Image.network(
                promotion.imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, object, stackTrace) => const SizedBox.shrink(),
              ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xCC000000), Color(0x33000000)],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    promotion.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  vGap(6),
                  Text(
                    promotion.description,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: .82),
                      fontSize: 13,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


