import 'package:coffee_lake_app/data/models/order/OrderData.dart';
import 'package:coffee_lake_app/data/repository/local/CartRepository.dart';
import 'package:coffee_lake_app/data/repository/local/UserRepository.dart';

class OrderRepository {
  static OrderData currentOrder = OrderData(
    cart: CartRepository.getCart(),
    bonuses: 0,
    totalSum: CartRepository.getTotals().last,
  );

  static OrderData? getOrder() {
    return currentOrder;
  }

  static void push() {
    UserRepository.currentUser?.bonuses -= currentOrder.bonuses;
    currentOrder.cart = CartRepository.getCart();
    currentOrder.bonuses = 0;
    currentOrder.totalSum = CartRepository.getTotals().last;
  }

  static double getTotal() {
    return (currentOrder.totalSum) - (currentOrder.bonuses ?? 0);
  }

  static void useBonus() {
    if (currentOrder.totalSum > UserRepository.currentUser!.bonuses) {
      currentOrder.bonuses = UserRepository.currentUser?.bonuses ?? 0;
    } else {
      currentOrder.bonuses = currentOrder.totalSum.round() ?? 0;
    }
  }

  static void removeBonus() {
    currentOrder.bonuses = 0;
  }

  static void updateCallback() {
    currentOrder.cart = CartRepository.getCart();
    currentOrder.totalSum = CartRepository.getTotals().last;
  }
}
