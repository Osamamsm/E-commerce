import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/home/presentation/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Store',
      child: Column(children: [CustomSearchTextField()]),
    );
  }
}
