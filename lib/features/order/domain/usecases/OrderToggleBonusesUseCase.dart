import 'package:coffee_lake_app/services/OrderService.dart';

class OrderToggleBonusesUseCase {
  OrderService orderService;
  OrderToggleBonusesUseCase(this.orderService);

  Future<void> call() async{
    await orderService.toggleBonus();
  }
}