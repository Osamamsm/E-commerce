import 'package:e_commerce/features/home/presentation/logic/get_promotions_cubit/get_promotions_state.dart';
import 'package:e_commerce/features/product/domain/repos/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPromotionsCubit extends Cubit<GetPromotionsState> {
  final ProductRepo _productRepo;
  GetPromotionsCubit(this._productRepo) : super(GetPromotionsInitial());

  Future<void> loadPromotions() async {
    emit(GetPromotionsLoading());
    final result = await _productRepo.getPromotions();
    result.fold(
      (failure) => emit(GetPromotionsError(failure.message.toString())),
      (promotions) => emit(GetPromotionsLoaded(promotions)),
    );
  }
}
