class WishlistState {
  final Set<String> wishListedIds;
  final bool isLoading;
  final String? errorMessage;

  const WishlistState({
    required this.wishListedIds,
    this.isLoading = false,
    this.errorMessage,
  });

  factory WishlistState.initial() => const WishlistState(wishListedIds: {});

  WishlistState copyWith({
    Set<String>? wishListedIds,
    bool? isLoading,
    String? errorMessage,
  }) {
    return WishlistState(
      wishListedIds: wishListedIds ?? this.wishListedIds,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool isWishListed(String productId) => wishListedIds.contains(productId);
}
