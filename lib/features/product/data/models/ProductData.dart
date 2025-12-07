class ProductData {
  final int id;
  final String name;
  final String description;
  final List<double> basePrice;
  final int sale;
  final String? imageUrl;
  final List<double> sizes;

  ProductData({
    required this.id,
    required this.name,
    required this.description,
    required this.basePrice,
    required this.sale,
    required this.imageUrl,
    required this.sizes,
  });

  factory ProductData.deserialize(Map<String, dynamic> json) {
    return ProductData(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      basePrice: (json['basePrice'] as List)
          .map((item) => (item as num).toDouble())
          .toList(),
      sale: json['sale'] as int? ?? 0,
      imageUrl: json['imageUrl'] as String? ?? '',
      sizes: (json['sizes'] as List)
          .map((item) => (item as num).toDouble())
          .toList(),
    );
  }
}
