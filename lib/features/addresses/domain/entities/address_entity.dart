class AddressEntity {
  final String? id;
  final String governorate;
  final String city;
  final String district;
  final String street;
  final String building;
  final int floor;
  final int apartmentNumber;
  final String label;
  final String? additionalNotes;
  final bool isDefault;

  AddressEntity({
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
  });
}
