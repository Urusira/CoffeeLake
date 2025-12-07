import 'package:coffee_lake_app/services/OrderService.dart';

class OrderRecalUsedBonusesUseCase {
  OrderService orderService;

  OrderRecalUsedBonusesUseCase(this.orderService);

  Future<void> call() async {
    await orderService.recalcUsedBonuses();
  }
}