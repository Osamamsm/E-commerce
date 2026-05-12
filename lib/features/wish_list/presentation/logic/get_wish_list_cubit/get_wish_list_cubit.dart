import 'package:e_commerce/features/wish_list/data/repos/wishlist_repo.dart';
import 'package:e_commerce/features/wish_list/presentation/logic/get_wish_list_cubit/get_wish_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetWishListCubit extends Cubit<GetWishListState> {
  final WishListRepo _wishlistRepo;

  GetWishListCubit(this._wishlistRepo) : super(GetWishListInitial());

  Future<void> getWishList() async {
    emit(GetWishListLoading());
    final result = await _wishlistRepo.getWishList();
    result.fold(
      (failure) => emit(GetWishListFailure(failure.message)),
      (products) => emit(GetWishListSuccess(products)),
    );
  }
}
