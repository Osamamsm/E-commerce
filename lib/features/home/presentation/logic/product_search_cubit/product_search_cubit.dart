import 'package:e_commerce/features/home/presentation/logic/product_search_cubit/product_search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSearchCubit extends Cubit<ProductSearchState> {
  ProductSearchCubit() : super(ProductSearchInitial());
}
