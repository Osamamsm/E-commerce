import 'package:flutter/material.dart';

class PromotionsErrorCard extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const PromotionsErrorCard({super.key, required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      height: 160,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        // Use error color as the dominant gradient — works in both themes
        gradient: LinearGradient(
          colors: [
            cs.error.withValues(alpha: 0.85),
            Color.lerp(cs.error, Colors.black, 0.35)!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Decorative background icon
          Positioned(
            right: -20,
            top: -20,
            child: Icon(
              Icons.wifi_off_rounded,
              size: 120,
              color: Colors.white.withValues(alpha: 0.08),
            ),
          ),

          // Subtle dark-left scrim for text legibility
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.black.withValues(alpha: 0.25),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                // Icon badge
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.error_outline_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Failed to load promotions',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        message,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.82),
                          fontSize: 13,
                          height: 1.4,
                        ),
                      ),

                      if (onRetry != null) ...[
                        const SizedBox(height: 14),
                        GestureDetector(
                          onTap: onRetry,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Retry',
                              style: TextStyle(
                                color: cs.error,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
