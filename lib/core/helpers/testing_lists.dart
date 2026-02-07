//TODO:will be deleted after integrating the supabase database
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

  static List<PaymentCardModel> paymentCardModels = [
    PaymentCardModel(
      id: '1',
      type: 'visa',
      lastFour: '5967',
      expiryDate: '09/26',
      cardHolderName: 'Alex Morgan',
      isDefault: true,
    ),
    PaymentCardModel(
      id: '2',
      type: 'mastercard',
      lastFour: '3821',
      expiryDate: '12/24',
      cardHolderName: 'Alex Morgan',
      isDefault: false,
    ),
    PaymentCardModel(
      id: '3',
      type: 'visa',
      lastFour: '1042',
      expiryDate: '01/25',
      cardHolderName: 'Alex Morgan',
      isDefault: false,
    ),
    PaymentCardModel(
      id: '4',
      type: 'mastercard',
      lastFour: '1042',
      expiryDate: '01/25',
      cardHolderName: 'Alex Morgan',
      isDefault: false,
    ),
  ];

  static List<PaymentMethod> paymentMethods = [
    PaymentMethod(
      id: 'card',
      type: PaymentType.card,
      label: 'Debit/Credit Card',
      description: 'Visa, Mastercard, Amex',
      isDefault: true,
    ),
    PaymentMethod(
      id: 'wallet',
      type: PaymentType.digitalWallet,
      label: 'Digital Wallet',
      description: 'Apple Pay, Google Pay',
      isDefault: false,
    ),
    PaymentMethod(
      id: 'cash',
      type: PaymentType.cashOnDelivery,
      label: 'Cash on Delivery',
      description: 'Pay when you receive',
      isDefault: false,
    ),
  ];

  static List<OrderItem> orderItems = [
  OrderItem(
    id: '1',
    name: 'Sony WH-1000XM5',
    color: 'Black 2023',
    price: 348.00,
    imageUrl: 'https://via.placeholder.com/80',
  ),
  OrderItem(
    id: '2',
    name: 'Apple Watch Series 9',
    color: 'Midnight 45mm',
    price: 399.00,
    imageUrl: 'https://via.placeholder.com/80',
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

class PaymentCardModel {
  final String id;
  final String type; // 'visa', 'mastercard'
  final String lastFour;
  final String expiryDate;
  final String cardHolderName;
  final bool isDefault;

  PaymentCardModel({
    required this.id,
    required this.type,
    required this.lastFour,
    required this.expiryDate,
    required this.cardHolderName,
    required this.isDefault,
  });
}

class PaymentMethod {
  final String id;
  final PaymentType type;
  final String label;
  final String description;
  final bool isDefault;

  PaymentMethod({
    required this.id,
    required this.type,
    required this.label,
    required this.description,
    required this.isDefault,
  });
}

enum PaymentType { card, digitalWallet, cashOnDelivery }


class OrderItem {
  final String id;
  final String name;
  final String color;
  final double price;
  final String imageUrl;

  OrderItem({
    required this.id,
    required this.name,
    required this.color,
    required this.price,
    required this.imageUrl,
  });
}