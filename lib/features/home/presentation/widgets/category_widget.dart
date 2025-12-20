import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key, required this.name, required this.image,
  });

final String name;
final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          backgroundImage: NetworkImage(image),
          radius: 30,
        ),
        vGap(5),
        Text(name, overflow: .ellipsis),
      ],
    );
  }
}