import 'package:e_commerce/features/product_details/presentation/widgets/expandable_section_header.dart';
import 'package:flutter/material.dart';

class ExpandableSection extends StatefulWidget {
  const ExpandableSection({
    super.key,
    required this.child,
    required this.title,
  });

  final Widget child;

  final String title;

  @override
  State<ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool _isExpanded = false;

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Column(
        children: [
          ExpandableSectionHeader(
            title: widget.title,
            isExpanded: _isExpanded,
            onTap: _toggle,
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _isExpanded ? 1 : 0,
              child: _isExpanded
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: widget.child,
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
