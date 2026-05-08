import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/features/home/presentation/logic/product_search_cubit/product_search_cubit.dart';
import 'package:e_commerce/features/home/presentation/logic/product_search_cubit/product_search_state.dart';
import 'package:e_commerce/features/home/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultsViewBody extends StatelessWidget {
  const SearchResultsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.kHorizontalPaddingMedium,
      child: BlocBuilder<ProductSearchCubit, ProductSearchState>(
        builder: (context, state) {
          if (state is ProductSearchError) {
            return Center(child: Text(state.message));
          } else if (state is ProductSearchLoaded) {
            final products = state.products;
            if (products.isEmpty) {
              return const Center(child: Text('No results found.'));
            }
            return GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25,
                mainAxisSpacing: 10,
                childAspectRatio: .4,
              ),
              children: products
                  .map((product) => ProductCard(product: product))
                  .toList(),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
