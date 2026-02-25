import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/default_flag_widget.dart';
import 'package:e_commerce/core/widgets/custom_popup_menu_button.dart';
import 'package:e_commerce/core/widgets/show_error_dialog.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/addresses/presentation/logic/set_default_address_cubit/set_default_address_cubit.dart';
import 'package:e_commerce/features/addresses/presentation/views/edit_address_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddressCardHeader extends StatelessWidget {
  const AddressCardHeader({
    super.key,
    required this.address,
    required this.icon,
    required this.isDefault,
  });

  final AddressEntity address;
  final IconData icon;
  final bool isDefault;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF7e22ce).withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: const Color(0xFFe9d5ff), size: 20),
        ),
        hGap(12),
        Text(address.label, style: Theme.of(context).textTheme.titleMedium),
        hGap(8),
        if (isDefault) DefaultFlagWidget(),
        const Spacer(),
        CustomPopupMenuButton(
          onEdit: () {
            context.push(EditAddressView.routeName);
          },
          onDelete: () {},
          onSetAsDefault: () {
            showCustomDialog(
              context: context,
              message: "Are you sure ,you want to set this address as default",
              dialogType: DialogType.warning,
              onOkPressed: () {
                context.read<SetDefaultAddressCubit>().setDefaultAddress(
                  address.id!,
                );
              },
              showCancelBtn: true,

              onCancelPressed: () {},
            );
          },
        ),
      ],
    );
  }
}
