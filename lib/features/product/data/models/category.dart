class Category {
  final String id;
  final String enName;
  final String arName;
  final String imageUrl;
  final String? parentCategoryId;
  final List<Category> subcategories;

  Category({
    required this.id,
    required this.enName,
    required this.arName,
    required this.imageUrl,
    this.parentCategoryId,
    required this.subcategories,
  });

  factory Category.fromSupabaseRow(Map<String, dynamic> row) {
    final childrenRaw = row['sub_categories'];
    return Category(
      id: row['category_id'] as String,
      enName: row['en_name'] as String,
      arName: row['ar_name'] as String,
      imageUrl: row['image_url'] as String,
      parentCategoryId: row['parent_category_id'] as String?,
      subcategories: (childrenRaw is List)
          ? childrenRaw
              .whereType<Map<String, dynamic>>()
              .map(Category.fromSupabaseRow)
              .toList()
          : <Category>[],
    );
  }

  factory Category.fromPromotion(Map<String, dynamic> row) {
  return Category(
    id: row['category_id'] as String,
    enName: row['en_name'] as String,
    arName: row['ar_name'] as String,
    imageUrl: row['image_url'] as String,
    parentCategoryId: null,
    subcategories: const [],
  );
}
}
