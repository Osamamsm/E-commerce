import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/saved_addresses_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class SavedAddressesView extends StatelessWidget {
  const SavedAddressesView({super.key});


static String routeName = '/saved-addresses-view';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: S.of(context).my_addresses,
      child: const SavedAddressesViewBody(),
    );
  }
}