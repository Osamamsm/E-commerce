import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({
    super.key,
    required this.isReadOnly,
    required this.initialRating,
  });

  final bool isReadOnly;
  final double initialRating;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      ratingWidget: RatingWidget(
        full: Icon(Icons.star, color: Colors.amber),
        half: Icon(Icons.star_half, color: Colors.amber),
        empty: Icon(Icons.star_border_outlined, color: Colors.grey),
      ),
      allowHalfRating: true,
      ignoreGestures: isReadOnly,
      initialRating: initialRating,
      onRatingUpdate: (rating) {},
      itemCount: 5,
      itemSize: 20,
    );
  }
}
