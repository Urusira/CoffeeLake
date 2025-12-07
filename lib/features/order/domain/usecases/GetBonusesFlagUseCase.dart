import 'package:coffee_lake_app/services/OrderService.dart';

class GetBonusesFlagUseCase {
  OrderService orderService;
  GetBonusesFlagUseCase(this.orderService);

  bool call() {
    return orderService.getBonusFlag();
  }
}