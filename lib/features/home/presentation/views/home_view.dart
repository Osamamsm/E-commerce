import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/cart/presentation/views/cart_view.dart';
import 'package:e_commerce/features/home/presentation/widgets/custom_drawer.dart';
import 'package:e_commerce/features/home/presentation/widgets/home_view_body.dart';
import 'package:e_commerce/features/profile/presentation/logic/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = '/home-view';

  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().getProfile();
    return SafeArea(
      child: CustomScaffold(
        title: 'Store',
        drawer: const CustomDrawer(),
        actionWidgets: [
          IconButton(
            onPressed: () {
              context.push(CartView.routeName);
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
        child: const HomeViewBody(),
      ),
    );
  }
}
