// product_details_view_body.dart

import 'package:flutter/material.dart';

class ProductDetailsErrorBody extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const ProductDetailsErrorBody({
    super.key,
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: Colors.white.withValues(alpha: .05),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 84,
                height: 84,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.withValues(alpha: .1),
                ),
                child: const Icon(
                  Icons.error_outline_rounded,
                  size: 42,
                  color: Colors.redAccent,
                ),
              ),

              const SizedBox(height: 22),

              const Text(
                'Failed to load product',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: .7),
                  fontSize: 14,
                  height: 1.5,
                ),
              ),

              if (onRetry != null) ...[
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: onRetry,
                    icon: const Icon(Icons.refresh_rounded),
                    label: const Text('Retry'),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}