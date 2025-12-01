class Product {
  final int id;
  final String name;
  final String description;
  final List<double> basePrice;
  final double sale;
  final String? imageUrl;
  final List<double> sizes;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.basePrice,
    required this.sale,
    required this.imageUrl,
    required this.sizes,
  });
}
