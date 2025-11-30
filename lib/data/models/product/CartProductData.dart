class CartProductData {
  final int id;
  final String name;
  double price;
  double? sale;
  final double vol;
  int count;

  CartProductData({
    required this.id,
    required this.name,
    required this.price,
    required this.sale,
    required this.vol,
    required this.count,
  });
}
