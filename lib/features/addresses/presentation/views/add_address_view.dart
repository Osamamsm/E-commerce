import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/core/widgets/custom_modal_progress.dart';
import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/core/widgets/show_error_dialog.dart';
import 'package:e_commerce/features/addresses/presentation/logic/add_new_address_cubit/add_new_address_cubit.dart';
import 'package:e_commerce/features/addresses/presentation/logic/add_new_address_cubit/add_new_address_state.dart';
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
    return BlocConsumer<AddNewAddressCubit, AddNewAddressState>(
      listener: (context, state) {
        if (state is AddNewAddressFailure) {
          showCustomDialog(
            context: context,
            message: state.message,
            dialogType: DialogType.error,
            onOkPressed: () {},
          );
        }
        if (state is AddNewAddressSuccess) {
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
        isLoading: state is AddNewAddressLoading,
        child: CustomScaffold(
          title: S.of(context).add_new_address,
          child: const AddAddressViewBody(),
        ),
      ),
    );
  }
}
