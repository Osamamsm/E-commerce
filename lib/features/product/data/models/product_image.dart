class ProductImage {
  final String imageUrl;
  final int sortOrder;

  const ProductImage({required this.imageUrl, required this.sortOrder});

  factory ProductImage.fromJson(Map<String, dynamic> j) =>
      ProductImage(imageUrl: j['image_url'], sortOrder: j['sort_order']);
}
