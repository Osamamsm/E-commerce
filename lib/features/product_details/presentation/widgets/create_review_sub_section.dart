import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/custom_rating_bar.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class CreateReviewSubSection extends StatelessWidget {
  const CreateReviewSubSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          S.of(context).add_review,
          style: theme.textTheme.bodyLarge,
        ),
        vGap(10),
        Align(
          alignment: Alignment.center,
          child: CustomRatingBar(
            isReadOnly: false,
            initialRating: 0,
          ),
        ),
        vGap(10),
        TextField(
          maxLines: 3,
          decoration: InputDecoration(
            fillColor: Theme.of(context).colorScheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            hintText: S.of(context).review_hint_text,
            hintStyle: theme.textTheme.bodySmall!.copyWith(
              color: Colors.grey[500],
            ),
          ),
        ),
        vGap(10),
        ElevatedButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: .center,
            children: [
              Icon(Icons.send),
              hGap(20),
              Text(S.of(context).submit_review),
            ],
          ),
        ),
      ],
    );
  }
}