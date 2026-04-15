import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) => {},
      maxLines: 1,
      decoration: InputDecoration(
        hintText: S.of(context).search_hint,
        prefixIcon: Icon(Icons.search_sharp),
      ),
    );
  }
}
