import 'package:e_commerce/features/home/presentation/logic/categories_cubit/categories_state.dart';
import 'package:e_commerce/features/product/domain/repos/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  final ProductRepo _productRepo;
  CategoriesCubit(this._productRepo) : super(CategoriesInitial());

  Future<void> loadCategories() async {
    emit(CategoriesLoading());
    final result = await _productRepo.getCategories();
    result.fold(
      (failure) => emit(CategoriesError(failure.toString())),
      (categories) => emit(CategoriesLoaded(categories)),
    );
  }
}
