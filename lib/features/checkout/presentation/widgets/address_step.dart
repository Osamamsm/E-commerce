import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/helpers/testing_lists.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/add_new_address_button.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/address_selectable_card.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/continue_button.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddressStep extends StatefulWidget {
  final List<Address> addresses;
  final VoidCallback onContinue;

  const AddressStep({
    super.key,
    required this.addresses,
    required this.onContinue,
  });

  @override
  State<AddressStep> createState() => _AddressStepState();
}

class _AddressStepState extends State<AddressStep> {
  String selectedAddressId = '1';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).shipping_to,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: const Color(0xFF6B6B7B),
                          letterSpacing: 1.2,
                        ),
                      ),
                      vGap(16),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverList.separated(
                  itemCount: widget.addresses.length,
                  itemBuilder: (context, index) {
                    final address = widget.addresses[index];
                    return AddressSelectableCard(
                      address: address,
                      isSelected: address.id == selectedAddressId,
                      onTap: () {
                        setState(() {
                          selectedAddressId = address.id;
                        });
                      },
                    );
                  },
                  separatorBuilder: (context, index) => vGap(16),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(24),
                sliver: SliverToBoxAdapter(child: AddNewAddressButton()),
              ),
            ],
          ),
        ),
        ContinueButton(
          label: S.of(context).continue_to_payment,
          onPressed: widget.onContinue,
        ),
      ],
    );
  }
}
