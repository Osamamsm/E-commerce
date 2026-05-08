import 'package:e_commerce/features/home/presentation/logic/categories_cubit/categories_cubit.dart';
import 'package:e_commerce/features/home/presentation/logic/categories_cubit/categories_state.dart';
import 'package:e_commerce/features/home/presentation/views/category_products_view.dart';
import 'package:e_commerce/features/home/presentation/widgets/categories_list_view.dart';
import 'package:e_commerce/features/product/data/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesBlocBuilder extends StatelessWidget {
  const CategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoaded) {
          return CategoriesListView(
            categories: state.categories,
            onCategorySelected: (category) {
              context.push(CategoryProductsView.routeName, extra: category);
            },
          );
        } else if (state is CategoriesError) {
          return Center(child: Text(state.message));
        }
        return Skeletonizer(
          child: CategoriesListView(
            categories: [
              Category.placeholder(),
              Category.placeholder(),
              Category.placeholder(),
            ],
            onCategorySelected: (category) {},
          ),
        );
      },
    );
  }
}
