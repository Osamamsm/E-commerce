

class TestingLists {



 static List<Address> addresses = [
    Address(
      id: '1',
      type: 'home',
      title: 'Home',
      isDefault: true,
      owner: 'Alex Doe',
      phone: '01214515785',
      street: '123 Innovation Drive, Tech Valley',
      apartment: 'Apartment 4B',
      city: 'San Francisco, CA 94103',
    ),
    Address(
      id: '2',
      type: 'work',
      title: 'Office',
      isDefault: false,
      owner: 'Alex Doe',
      phone: '01214515785',
      street: '456 Market Street, Suite 200',
      apartment: 'Apartment 4B',
      city: 'San Francisco, CA 94105',
    ),
    Address(
      id: '3',
      type: 'other',
      title: "Mom's House",
      isDefault: false,
      owner: 'Jane Doe',
      phone: '01214515785',
      street: '789 Suburbia Lane',
      apartment: 'Apartment 4B',
      city: 'Palo Alto, CA 94301',
    ),
    Address(
      id: '4',
      type: 'other',
      title: 'Lake House',
      isDefault: false,
      owner: 'Alex Doe',
      phone: '01214515785',
      street: '321 Vacation Road',
      apartment: 'Apartment 4B',
      city: 'Tahoe City, CA 96145',
    ),
  ];
}


class Address {
  final String id;
  final String type; // 'home', 'work', 'other'
  final String title;
  final bool isDefault;
  final String owner;
  final String phone;
  final String street;
  final String apartment;
  final String city;

  Address({
    required this.id,
    required this.type,
    required this.title,
    required this.isDefault,
    required this.owner,
    required this.phone,
    required this.street,
    required this.apartment,
    required this.city,
  });
}