import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;
  final List<String> steps;

  const StepIndicator({
    super.key,
    required this.currentStep,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        steps.length * 2 - 1,
        (index) {
          if (index.isEven) {
            final stepIndex = index ~/ 2;
            return _StepCircle(
              step: stepIndex,
              label: steps[stepIndex],
              currentStep: currentStep,
            );
          } else {
            final stepIndex = index ~/ 2;
            return Expanded(
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: stepIndex < currentStep
                        ? [const Color(0xFF7C3AED), const Color(0xFF7C3AED)]
                        : [const Color(0xFF2D2440), const Color(0xFF2D2440)],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class _StepCircle extends StatelessWidget {
  final int step;
  final String label;
  final int currentStep;

  const _StepCircle({
    required this.step,
    required this.label,
    required this.currentStep,
  });

  IconData _getIcon() {
    if (step == 0) return Icons.location_on;
    if (step == 1) return Icons.credit_card;
    return Icons.receipt_long;
  }

  @override
  Widget build(BuildContext context) {
    final bool isCompleted = step < currentStep;
    final bool isCurrent = step == currentStep;
    final bool isUpcoming = step > currentStep;

    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCurrent
                ? const Color(0xFF7C3AED)
                : isCompleted
                    ? const Color(0xFF7C3AED)
                    : const Color(0xFF2D2440),
            border: Border.all(
              color: isUpcoming ? const Color(0xFF2D2440) : Colors.transparent,
              width: 2,
            ),
          ),
          child: Icon(
            isCompleted ? Icons.check : _getIcon(),
            color: isUpcoming ? const Color(0xFF6B6B7B) : Colors.white,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: isUpcoming ? const Color(0xFF6B6B7B) : Colors.white,
            fontSize: 12,
            fontWeight: isCurrent ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}