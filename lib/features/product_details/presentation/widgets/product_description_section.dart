import 'package:e_commerce/features/product_details/presentation/widgets/expandable_section.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProductDescriptionSection extends StatelessWidget {
  const ProductDescriptionSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ExpandableSection(
      title: S.of(context).product_description,
      child: Text(
        description,
        style: theme.textTheme.bodySmall?.copyWith(
          color: Colors.grey.shade400,
          height: 1.5,
        ),
      ),
    );
  }
}

