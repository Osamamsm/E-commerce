import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/helpers/testing_lists.dart';
import 'package:e_commerce/core/helpers/validators.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/address_type_selector.dart';
import 'package:e_commerce/core/widgets/default_toggle.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/form_section.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/glass_text_field.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/save_address_button.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class EditAddressViewBody extends StatefulWidget {
  const EditAddressViewBody({super.key, required this.address});

  final Address address;
  @override
  State<EditAddressViewBody> createState() => _EditAddressViewBodyState();
}

class _EditAddressViewBodyState extends State<EditAddressViewBody> {
  final _formKey = GlobalKey<FormState>();

  String? selectedState;
  late String fullName, phoneNumber, streetAddress, aptSuiteEtc, city;
  late bool isDefault;
  late String selectedType;
  @override
  void initState() {
    super.initState();
    isDefault = widget.address.isDefault;
    selectedType = widget.address.type;
    fullName = widget.address.owner;
    phoneNumber = widget.address.phone;
    streetAddress = widget.address.street;
    aptSuiteEtc = widget.address.apartment;
    city = widget.address.city;
  }

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
                    selectedType: selectedType,
                    onTypeSelected: (type) {
                      setState(() {
                        selectedType = type;
                      });
                    },
                  ),
                  vGap(24),
                  FormSection(
                    title: s.contact_info,
                    children: [
                      GlassTextField(
                        initialValue: widget.address.owner,
                        hintText: s.full_name,
                        validator: Validators.fullNameValidator,
                        onSaved: (value) {
                          fullName = value!;
                        },
                      ),
                      vGap(12),
                      GlassTextField(
                        initialValue: widget.address.phone,
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
                        initialValue: widget.address.street,
                        hintText: s.street_address,
                        suffixIcon: Icons.location_on,
                        validator: Validators.addressFieldValidator,
                        onSaved: (value) {
                          streetAddress = value!;
                        },
                      ),
                      vGap(12),
                      GlassTextField(
                        initialValue: widget.address.apartment,
                        hintText: s.apt_suite_etc,
                        validator: Validators.addressFieldValidator,
                        onSaved: (value) {
                          aptSuiteEtc = value!;
                        },
                      ),
                      vGap(12),
                      GlassTextField(
                        initialValue: widget.address.city,
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
                  DefaultToggle(
                    value: isDefault,
                    label: s.set_as_default_address,
                    subtitle: s.use_this_address_for_checkout,
                    onChanged: (value) {
                      setState(() {
                        isDefault = value;
                      });
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
