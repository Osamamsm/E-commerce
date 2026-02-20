import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/error_body.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/addresses/presentation/logic/get_addresses_cubit/get_addresses_cubit.dart';
import 'package:e_commerce/features/addresses/presentation/logic/get_addresses_cubit/get_addresses_state.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/address_card.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/saved_addresses_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SavedAddressesBlocBuilder extends StatelessWidget {
  const SavedAddressesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAddressesCubit, GetAddressesState>(
      builder: (context, state) {
        if (state is GetAddressesFailure) {
          return ErrorBody(
            onRetry: () {
              context.read<GetAddressesCubit>().getAddresses();
            },
            errMessage: state.message,
            goHomeEnabled: true,
          );
        }
        if (state is GetAddressesSuccess) {
          if (state.addresses.isEmpty) {
            return Center(
              child: Text(
                S.of(context).no_addresses,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            );
          }
          return SavedAddressesViewBody(addresses: state.addresses);
        }
        return _LoadingBody();
      },
    );
  }
}

class _LoadingBody extends StatelessWidget {
  const _LoadingBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Skeletonizer(
        child: ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) {
            return AddressCard(
              address: AddressEntity(
                id: '',
                label: 'label',
                governorate: 'governorate',
                city: 'city',
                street: 'street',
                building: 'building',
                apartmentNumber: 10,
                isDefault: false,
                district: 'district',
                floor: 5,
                additionalNotes: 'additionalNotes',
              ),
            );
          },
          separatorBuilder: (context, index) => vGap(16),
        ),
      ),
    );
  }
}
