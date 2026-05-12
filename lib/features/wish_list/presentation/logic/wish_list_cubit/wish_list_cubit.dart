import 'package:e_commerce/features/wish_list/data/repos/wishlist_repo.dart';
import 'package:e_commerce/features/wish_list/presentation/logic/wish_list_cubit/wish_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class WishlistCubit extends Cubit<WishlistState> {
  final WishListRepo _repository;

  WishlistCubit(this._repository) : super(WishlistState.initial());

  Future<void> loadIds(String userId) async {
    emit(state.copyWith(isLoading: true));

    final result = await _repository.getWishlistIds();

    result.fold(
      (failure) =>
          emit(state.copyWith(errorMessage: failure.message, isLoading: false)),
      (ids) => emit(
        state.copyWith(wishListedIds: Set<String>.from(ids), isLoading: false),
      ),
    );
  }

  Future<void> toggle(String userId, String productId) async {
    final updated = Set<String>.from(state.wishListedIds);

    if (updated.contains(productId)) {
      updated.remove(productId);
      emit(state.copyWith(wishListedIds: updated));

      final result = await _repository.removeFromWishList(productId);

      result.fold(
        (failure) => emit(
          state.copyWith(
            wishListedIds: updated..add(productId),
            errorMessage: failure.message,
          ),
        ),
        (_) {},
      );
    } else {
      updated.add(productId);
      emit(state.copyWith(wishListedIds: updated));

      final result = await _repository.addToWishList(productId);

      result.fold(
        (failure) => emit(
          state.copyWith(
            wishListedIds: updated..remove(productId),
            errorMessage: failure.message,
          ),
        ),
        (_) {},
      );
    }
  }
}
