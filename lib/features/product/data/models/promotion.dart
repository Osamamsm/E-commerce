import 'package:e_commerce/features/product/data/models/category.dart';

class Promotion {
  final String id;
  final String title;
  final String description;
  final double discountRate;
  final DateTime startDate;
  final DateTime endDate;
  final String? imageUrl;
  final List<Category> categories;

  Promotion({
    required this.id,
    required this.title,
    required this.description,
    required this.discountRate,
    required this.startDate,
    required this.endDate,
    this.imageUrl,
    this.categories = const [],
  });

  factory Promotion.fromJson(Map<String, dynamic> json) {
    return Promotion(
      id: json['id'],
      title: json['name'],
      description: json['description'],
      discountRate: json['discount_rate'].toDouble(),
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      imageUrl: json['image_url'],
      categories: (json['categories'] as List)
          .map((e) => Category.fromSupabaseRow(e))
          .toList(),

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': title,
      'description': description,
      'discount_rate': discountRate,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      'image_url': imageUrl,
    };
  }
}
