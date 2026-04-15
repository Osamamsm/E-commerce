import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) => {
        context.push('/search-results-view', extra: value),
      },
      maxLines: 1,
      decoration: InputDecoration(
        hintText: S.of(context).search_hint,
        prefixIcon: Icon(Icons.search_sharp),
      ),
    );
  }
}
