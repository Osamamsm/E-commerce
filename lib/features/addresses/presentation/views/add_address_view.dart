import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/core/widgets/custom_modal_progress.dart';
import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/core/widgets/show_error_dialog.dart';
import 'package:e_commerce/features/addresses/presentation/logic/addresses_cubit/addresses_cubit.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/add_address_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key});

  static String routeName = '/add-address-view';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressesCubit, AddressesState>(
      listenWhen: (previous, current) =>
          current.action == AddressesAction.addAddress,
      buildWhen: (previous, current) =>
          current.action == AddressesAction.addAddress,
      listener: (context, state) {
        if (state.status == AddressesStatus.failure) {
          showCustomDialog(
            context: context,
            message: state.errorMessage ?? '',
            dialogType: DialogType.error,
            onOkPressed: () {},
          );
        }
        if (state.status == AddressesStatus.success) {
          showCustomDialog(
            context: context,
            message: S.of(context).address_added_successfully,
            dialogType: DialogType.success,
            onOkPressed: () {
              context.pop();
            },
          );
        }
      },
      builder: (context, state) => CustomModalProgress(
        isLoading:
            state.status == AddressesStatus.loading &&
            state.action == AddressesAction.addAddress,
        child: CustomScaffold(
          title: S.of(context).add_new_address,
          child: const AddAddressViewBody(),
        ),
      ),
    );
  }
}
