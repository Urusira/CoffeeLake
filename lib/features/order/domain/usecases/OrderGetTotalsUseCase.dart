import 'package:coffee_lake_app/services/OrderService.dart';

class OrderGetTotalsUseCase {
  OrderService orderService;
  OrderGetTotalsUseCase(this.orderService);

  Future<Map<String, double>> call() async {
    return await orderService.getTotals();
  }
}