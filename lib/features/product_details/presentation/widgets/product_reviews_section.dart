import 'package:e_commerce/features/product_details/presentation/widgets/create_review_sub_section.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/expandable_section.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProductReviewsSection extends StatelessWidget {
  const ProductReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandableSection(
      title: S.of(context).product_reviews,
      child: CreateReviewSubSection(),
    );
  }
}
