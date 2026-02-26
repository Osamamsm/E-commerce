import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/core/widgets/custom_modal_progress.dart';
import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/core/widgets/show_error_dialog.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/addresses/presentation/logic/update_address_cubit/update_address_cubit.dart';
import 'package:e_commerce/features/addresses/presentation/logic/update_address_cubit/update_address_state.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/edit_address_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditAddressView extends StatelessWidget {
  const EditAddressView({super.key});
  static String routeName = '/edit-address';
  @override
  Widget build(BuildContext context) {
    final address = GoRouterState.of(context).extra as AddressEntity;
    return BlocConsumer<UpdateAddressCubit, UpdateAddressState>(
      listener: (context, state) {
        if (state is UpdateAddressFailure) {
          showCustomDialog(
            context: context,
            message: state.message,
            dialogType: DialogType.error,
            onOkPressed: () {},
          );
        }
        if (state is UpdateAddressSuccess) {
          showCustomDialog(
            context: context,
            message: S.of(context).address_updated_successfully,
            dialogType: DialogType.success,
            onOkPressed: () {
              context.pop();
            },
          );
        }
      },
      builder: (context, state) {
        return CustomModalProgress(
          isLoading: state is UpdateAddressLoading,
          child: CustomScaffold(
            title: S.of(context).edit_address,
            child: EditAddressViewBody(address: address),
          ),
        );
      },
    );
  }
}
