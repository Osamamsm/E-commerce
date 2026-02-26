import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/helpers/validators.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/addresses/presentation/logic/addresses_cubit/addresses_cubit.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/address_type_selector.dart';
import 'package:e_commerce/core/widgets/default_toggle.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/form_section.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/glass_text_field.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/save_address_button.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditAddressViewBody extends StatefulWidget {
  const EditAddressViewBody({super.key, required this.address});

  final AddressEntity address;
  @override
  State<EditAddressViewBody> createState() => _EditAddressViewBodyState();
}

class _EditAddressViewBodyState extends State<EditAddressViewBody> {
  final _formKey = GlobalKey<FormState>();

  late String selectedAddressType;
  late bool isDefaultAddress;
  late String governorate,
      city,
      district,
      street,
      building,
      floor,
      apartmentNumber;
  String? additionalNotes;
  @override
  void initState() {
    super.initState();
    isDefaultAddress = widget.address.isDefault;
    selectedAddressType = widget.address.label;
    governorate = widget.address.governorate;
    city = widget.address.city;
    district = widget.address.district;
    street = widget.address.street;
    building = widget.address.building;
    floor = widget.address.floor.toString();
    apartmentNumber = widget.address.apartmentNumber.toString();
    additionalNotes = widget.address.additionalNotes;
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
                    selectedType: selectedAddressType,
                    onTypeSelected: (type) {
                      setState(() {
                        selectedAddressType = type;
                      });
                    },
                  ),
                  vGap(24),
                  FormSection(
                    title: s.region,
                    children: [
                      GlassTextField(
                        initialValue: governorate,
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
                              initialValue: city,
                              hintText: s.city,
                              validator: Validators.addressFieldValidator,
                              onSaved: (value) => city = value!,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: GlassTextField(
                              initialValue: district,
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
                        initialValue: street,
                        hintText: s.street,
                        suffixIcon: Icons.location_on_outlined,
                        validator: Validators.addressFieldValidator,
                        onSaved: (value) => street = value!,
                      ),
                      vGap(12),
                      GlassTextField(
                        initialValue: building,
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
                              initialValue: floor,
                              hintText: s.floor,
                              keyboardType: TextInputType.number,
                              validator: Validators.addressFieldValidator,
                              onSaved: (value) => floor = value!,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: GlassTextField(
                              initialValue: apartmentNumber,
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
                        initialValue: additionalNotes,
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
                        context.read<AddressesCubit>().updateAddress(
                          widget.address.copyWith(
                            governorate: governorate,
                            city: city,
                            district: district,
                            street: street,
                            building: building,
                            floor: int.parse(floor),
                            apartmentNumber: int.parse(apartmentNumber),
                            additionalNotes: additionalNotes,
                            label: selectedAddressType,
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
