import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/helpers/validators.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/addresses/presentation/logic/add_new_address_cubit/add_new_address_cubit.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/address_type_selector.dart';
import 'package:e_commerce/core/widgets/default_toggle.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/form_section.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/glass_text_field.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/save_address_button.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAddressViewBody extends StatefulWidget {
  const AddAddressViewBody({super.key});

  @override
  State<AddAddressViewBody> createState() => _AddAddressViewBodyState();
}

class _AddAddressViewBodyState extends State<AddAddressViewBody> {
  final _formKey = GlobalKey<FormState>();
  String selectedAddressType = 'Home';
  bool isDefaultAddress = false;

  late String governorate,
      city,
      district,
      street,
      building,
      floor,
      apartmentNumber;
  String? additionalNotes;

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

                  // ── Section 1: Region ──────────────────────────────────────
                  FormSection(
                    title: s.region,
                    children: [
                      GlassTextField(
                        hintText: s.governorate,
                        suffixIcon: Icons.map_outlined,
                        validator: Validators.addressFieldValidator,
                        onSaved: (value) => governorate = value!,
                      ),
                      vGap(12),
                      // City & District side-by-side
                      Row(
                        children: [
                          Expanded(
                            child: GlassTextField(
                              hintText: s.city,
                              validator: Validators.addressFieldValidator,
                              onSaved: (value) => city = value!,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: GlassTextField(
                              hintText: s.district,
                              validator: Validators.addressFieldValidator,
                              onSaved: (value) => district = value!,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  vGap(24),

                  // ── Section 2: Building Details ────────────────────────────
                  FormSection(
                    title: s.building_details,
                    children: [
                      GlassTextField(
                        hintText: s.street,
                        suffixIcon: Icons.location_on_outlined,
                        validator: Validators.addressFieldValidator,
                        onSaved: (value) => street = value!,
                      ),
                      vGap(12),
                      GlassTextField(
                        hintText: s.building,
                        suffixIcon: Icons.apartment_outlined,
                        validator: Validators.addressFieldValidator,
                        onSaved: (value) => building = value!,
                      ),
                      vGap(12),
                      // Floor & Apartment side-by-side
                      Row(
                        children: [
                          Expanded(
                            child: GlassTextField(
                              hintText: s.floor,
                              keyboardType: TextInputType.number,
                              validator: Validators.addressFieldValidator,
                              onSaved: (value) => floor = value!,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: GlassTextField(
                              hintText: s.apartment_number,
                              keyboardType: TextInputType.number,
                              validator: Validators.addressFieldValidator,
                              onSaved: (value) => apartmentNumber = value!,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  vGap(24),

                  // ── Section 3: Additional Notes ────────────────────────────
                  FormSection(
                    title: s.additional_notes,
                    children: [
                      GlassTextField(
                        hintText: s.additional_notes_hint_text,
                        maxLines: 3,
                        onSaved: (value) => additionalNotes = value,
                      ),
                    ],
                  ),
                  vGap(24),

                  DefaultToggle(
                    value: isDefaultAddress,
                    onChanged: (value) {
                      setState(() => isDefaultAddress = value);
                    },
                    label: s.set_as_default_address,
                    subtitle: s.use_this_address_for_checkout,
                  ),
                  vGap(24),

                  SaveAddressButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context.read<AddNewAddressCubit>().addNewAddress(
                          AddressEntity(
                            governorate: governorate,
                            city: city,
                            district: district,
                            street: street,
                            building: building,
                            floor: int.parse(floor),
                            apartmentNumber: int.parse(apartmentNumber),
                            label: selectedAddressType,
                            additionalNotes: additionalNotes,
                            isDefault: isDefaultAddress,
                          ),
                        );
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
