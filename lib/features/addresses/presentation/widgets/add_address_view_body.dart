import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/helpers/validators.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/address_type_selector.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/default_address_toggle.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/form_section.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/glass_text_field.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/save_address_button.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddAddressViewBody extends StatefulWidget {
  const AddAddressViewBody({super.key});

  @override
  State<AddAddressViewBody> createState() => _AddAddressViewBodyState();
}

class _AddAddressViewBodyState extends State<AddAddressViewBody> {
  final _formKey = GlobalKey<FormState>();
  String selectedAddressType = 'home';
  bool isDefaultAddress = false;
  String? selectedState;
  late String fullName, phoneNumber, streetAddress, aptSuiteEtc, city;
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddressTypeSelector(
                    selectedType: selectedAddressType,
                    onTypeSelected: (type) {
                      setState(() => selectedAddressType = type);
                    },
                  ),
                  vGap(24),
                  FormSection(
                    title: s.contact_info,
                    children: [
                      GlassTextField(
                        hintText: s.full_name,
                        validator: Validators.fullNameValidator,
                        onSaved: (value) {
                          fullName = value!;
                        },
                      ),
                      vGap(12),
                      GlassTextField(
                        hintText: s.phone_number,
                        suffixIcon: Icons.phone,
                        validator: Validators.phoneNumberValidator,
                        onSaved: (value) {
                          phoneNumber = value!;
                        },
                      ),
                    ],
                  ),
                  vGap(24),
                  FormSection(
                    title: s.address_details,
                    children: [
                      GlassTextField(
                        hintText: s.street_address,
                        suffixIcon: Icons.location_on,
                        validator: Validators.addressFieldValidator,
                        onSaved: (value) {
                          streetAddress = value!;
                        },
                      ),
                      vGap(12),
                      GlassTextField(
                        hintText: s.apt_suite_etc,
                        validator: Validators.addressFieldValidator,
                        onSaved: (value) {
                          aptSuiteEtc = value!;  
                        },
                      ),
                      vGap(12),
                      GlassTextField(
                        hintText: s.city,
                        validator: Validators.addressFieldValidator,
                        onSaved: (value) {
                          city = value!;
                        },
                      ),
                      vGap(12),
                    ],
                  ),
                  vGap(24),
                  DefaultAddressToggle(
                    value: isDefaultAddress,
                    onChanged: (value) {
                      setState(() => isDefaultAddress = value);
                    },
                  ),
                  vGap(24),
                  SaveAddressButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                    },
                  ),
                  vGap(24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
