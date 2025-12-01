import '../product/CartProductData.dart';

class OrderData {
  List<CartProductData> cart;
  int bonuses;
  double totalSum;

  OrderData({
    required this.cart,
    required this.bonuses,
    required this.totalSum,
  });
}
