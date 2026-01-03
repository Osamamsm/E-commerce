import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/create_review_sub_section.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/expandable_section.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/review_card.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProductReviewsSection extends StatelessWidget {
  const ProductReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandableSection(
      title: S.of(context).product_reviews,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CreateReviewSubSection(),
          vGap(10),
          Divider(color: Theme.of(context).colorScheme.outline),
          vGap(10),
          Text(
            S.of(context).review(121),
            style: Theme.of(context).textTheme.labelLarge,
          ),
          //TODO: remove the shrinkWrap and physics to improve performance
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ReviewCard(),
            separatorBuilder: (context, index) => Divider(
              color: Theme.of(context).colorScheme.outline,
              height: 20,
            ),
            itemCount: 3,
          ),
          vGap(10),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              S.of(context).see_all_reviews,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
