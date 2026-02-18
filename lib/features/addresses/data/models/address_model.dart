import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';

class AddressModel {
  String? id;
  String governorate;
  String city;
  String district;
  String street;
  String building;
  String floor;
  int apartmentNumber;
  String label;
  String? additionalNotes;
  bool isDefault;
  DateTime? createdAt;

  AddressModel({
    this.id,
    required this.governorate,
    required this.city,
    required this.district,
    required this.street,
    required this.building,
    required this.floor,
    required this.apartmentNumber,
    required this.label,
    required this.additionalNotes,
    required this.isDefault,
    this.createdAt,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    id: json['id'],
    governorate: json['governorate'],
    city: json['city'],
    district: json['district'],
    street: json['street'],
    building: json['building'],
    floor: json['floor'],
    apartmentNumber: json['apartment_number'],
    label: json['label'],
    additionalNotes: json['additional_notes'],
    isDefault: json['is_default'],
    createdAt: DateTime.parse(json['created_at']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'governorate': governorate,
    'city': city,
    'district': district,
    'street': street,
    'building': building,
    'floor': floor,
    'apartment_number': apartmentNumber,
    'label': label,
    'additional_notes': additionalNotes,
    'is_default': isDefault,
    'created_at': createdAt?.toIso8601String(),
  };

  AddressEntity toEntity() {
    return AddressEntity(
      id: id,
      governorate: governorate,
      city: city,
      district: district,
      street: street,
      building: building,
      floor: floor,
      apartmentNumber: apartmentNumber,
      label: label,
      additionalNotes: additionalNotes,
      isDefault: isDefault,
    );
  }

  factory AddressModel.fromEntity(AddressEntity entity) {
    return AddressModel(
      id: entity.id,
      governorate: entity.governorate,
      city: entity.city,
      district: entity.district,
      street: entity.street,
      building: entity.building,
      floor: entity.floor,
      apartmentNumber: entity.apartmentNumber,
      label: entity.label,
      additionalNotes: entity.additionalNotes,
      isDefault: entity.isDefault,
    );
  }
}
