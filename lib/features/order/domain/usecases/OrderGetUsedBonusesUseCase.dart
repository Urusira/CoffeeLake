import 'package:coffee_lake_app/services/OrderService.dart';

class OrderGetUsedBonusesUseCase {
  OrderService orderService;

  OrderGetUsedBonusesUseCase(this.orderService);

  Future<int> call() async {
    return await orderService.getUsedBonuses();
  }
}