import 'package:e_commerce/core/models/menu_item.dart';
import 'package:e_commerce/features/addresses/presentation/views/saved_addresses_view.dart';
import 'package:e_commerce/features/auth/presentation/logic/sign_out_cubit/sign_out_cubit.dart';
import 'package:e_commerce/features/payment/presentation/views/payment_methods_view.dart';
import 'package:e_commerce/features/profile/presentation/views/personal_details_view.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Constants {
  static const EdgeInsets kHorizontalPaddingMedium = EdgeInsets.symmetric(
    horizontal: 12.0,
  );

  static List<MenuItem> getMenuItems(BuildContext context) {
    final s = S.of(context);
    return [
      MenuItem(
        icon: Icons.favorite_border_outlined,
        label: s.wishlist,
        onTap: () {},
      ),
      MenuItem(
        icon: Icons.map,
        label: s.saved_addresses,
        onTap: () {
          GoRouter.of(context).push(SavedAddressesView.routeName);
        },
      ),
      MenuItem(
        icon: Icons.payment_outlined,
        label: s.payment_methods,
        onTap: () {
          GoRouter.of(context).push(PaymentMethodsView.routeName);
        },
      ),
      MenuItem(icon: Icons.receipt_long, label: s.order_history, onTap: () {}),
      MenuItem(
        icon: Icons.logout,
        label: s.sign_out,
        onTap: () {
          context.read<SignOutCubit>().signOut();
        },
      ),
    ];
  }

  static List<Map<String, dynamic>> getProfileMenuSections(
    BuildContext context,
  ) {
    final s = S.of(context);
    return [
      {
        'title': s.account_information,
        'items': [
          {
            'icon': Icons.person_outline,
            'title': s.personal_details,
            'onTap': () {
              GoRouter.of(context).push(PersonalDetailsView.routeName);
            },
          },
          {
            'icon': Icons.shopping_bag_outlined,
            'title': s.my_orders,
            'onTap': () {},
          },
        ],
      },
      {
        'title': s.quick_access,
        'items': [
          {'icon': Icons.favorite_outline, 'title': s.wishlist, 'onTap': () {}},
          {
            'icon': Icons.location_on_outlined,
            'title': s.saved_addresses,
            'onTap': () {
              GoRouter.of(context).push(SavedAddressesView.routeName);
            },
          },
          {
            'icon': Icons.credit_card_outlined,
            'title': s.payment_methods,
            'onTap': () {
              GoRouter.of(context).push(PaymentMethodsView.routeName);
            },
          },
        ],
      },
      {
        'title': s.security,
        'items': [
          {
            'icon': Icons.lock_outline,
            'title': s.change_password,
            'onTap': () {},
          },
          {
            'icon': Icons.logout,
            'title': s.sign_out,
            'isSignout': true,
            'onTap': () {
              context.read<SignOutCubit>().signOut();
            },
          },
        ],
      },
    ];
  }
}
