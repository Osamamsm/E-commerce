import 'package:e_commerce/features/product/data/models/promotion.dart';

class GetPromotionsState {}

final class GetPromotionsInitial extends GetPromotionsState {}

final class GetPromotionsLoading extends GetPromotionsState {}

final class GetPromotionsLoaded extends GetPromotionsState {
  final List<Promotion> promotions;

  GetPromotionsLoaded(this.promotions);
}

final class GetPromotionsError extends GetPromotionsState {
  final String message;

  GetPromotionsError(this.message);
}
