import 'package:coffee_lake_app/services/OrderService.dart';

class OrderPushUseCase {
  OrderService orderService;
  OrderPushUseCase(this.orderService);

  Future<void> call() async {
    await orderService.doOrder();
  }
}