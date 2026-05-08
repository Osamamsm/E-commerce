import 'package:e_commerce/features/home/presentation/logic/get_promotions_cubit/get_promotions_cubit.dart';
import 'package:e_commerce/features/home/presentation/logic/get_promotions_cubit/get_promotions_state.dart';
import 'package:e_commerce/features/home/presentation/widgets/promotions_banner.dart';
import 'package:e_commerce/features/home/presentation/widgets/promotions_error_card.dart';
import 'package:e_commerce/features/product/data/models/promotion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PromotionsBlocBuilder extends StatelessWidget {
  const PromotionsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPromotionsCubit, GetPromotionsState>(
      builder: (context, state) {
        if (state is GetPromotionsLoaded) {
          return PromotionsBanner(promotions: state.promotions);
        } else if (state is GetPromotionsError) {
          return PromotionsErrorCard(
            message: state.message,
            onRetry: () {
              context.read<GetPromotionsCubit>().loadPromotions();
            },
          );
        }
        return Skeletonizer(
          child: PromotionsBanner(
            promotions: [
              Promotion.placeholder(),
              Promotion.placeholder(),
              Promotion.placeholder(),
            ],
          ),
        );
      },
    );
  }
}
