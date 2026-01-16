import 'package:e_commerce/core/models/menu_item.dart';
import 'package:e_commerce/features/addresses/presentation/views/saved_addresses_view.dart';
import 'package:e_commerce/features/auth/presentation/logic/sign_out_cubit/sign_out_cubit.dart';
import 'package:e_commerce/features/payment/presentation/views/payment_methods_view.dart';
import 'package:e_commerce/features/profile/presentation/views/personal_details_view.dart';
import 'package:e_commerce/features/wish_list/presentation/views/wish_list_view.dart';
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
        onTap: () {
          GoRouter.of(context).push(WishListView.routeName);
        },
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
          {
            'icon': Icons.favorite_outline,
            'title': s.wishlist,
            'onTap': () {
              GoRouter.of(context).push(WishListView.routeName);
            },
          },
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

  static List<Map<String, dynamic>> getProfileInfoSections(
    BuildContext context,
  ) {
    final s = S.of(context);
    return [
      {
        'title': s.personal_details,
        'items': [
          {
            "label": s.full_name,
                "value": 'Julian Alexander',
                "icon": Icons.person_outline,
          },
          {
            "label": s.email,
                "value": 'julian.s@example.com',
                "icon": Icons.email_outlined,
          },
          {
            "label": s.phone_number,
                "value": '+1 (555) 012-3456',
                "icon": Icons.phone_outlined,
          },
        ],
      },
      {
        'title': S.of(context).account,
        'items': [
          {
            "label": s.member_since,
                "value": 'January 2024',
                "icon": Icons.calendar_today_outlined,
          },
          {
            "label": s.account_status,
                "value": 'Active',
                "icon": Icons.verified_outlined,
                "valueColor": const Color(0xFF34d399),
          },
        ],
      },
    ];
  }
}
