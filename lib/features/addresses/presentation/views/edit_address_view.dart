import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/edit_address_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class EditAddressView extends StatelessWidget {
  const EditAddressView({super.key});
  static String routeName = '/edit-address';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(title: S.of(context).edit_address,child: EditAddressViewBody());
  }
}
