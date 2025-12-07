import 'dart:math';

import 'package:coffee_lake_app/features/cart/domain/repositories/CartRepository.dart';
import 'package:coffee_lake_app/features/auth/domain/repositories/AuthRepository.dart';
import 'package:coffee_lake_app/features/product/data/models/CartProductData.dart';

import '../core/Network.dart';
import '../core/di.dart';

class OrderService {
  CartRepository cartRepository;
  AuthRepository authRepository;

  OrderService(this.cartRepository, this.authRepository);

  bool useBonusesFlag = false;
  int usedBonuses = 0;

  Future<void> doOrder() async {
    List<CartProductData> cart = await cartRepository.getCart();
    if (cart.isEmpty) return;

    await di<Network>().dio.post('/order', data: {
      'items': cart.map((product) => {
        'id': product.id,
        'name': product.name,
        'vol': product.vol,
        'price': product.price,
        'sale': product.sale,
        'count': product.count,
      }).toList(),
      'total': (await getTotals())['total'],
      'bonuses': usedBonuses,
    });

    await cartRepository.clearAll();

    useBonusesFlag = false;
    usedBonuses = 0;

    await recalcUsedBonuses();
  }

  Future<void> toggleBonus() async {
    useBonusesFlag = !useBonusesFlag;
    await recalcUsedBonuses();
  }

  Future<int> getUsedBonuses() async {
    return usedBonuses;
  }

  Future<int> recalcUsedBonuses() async {
    if(useBonusesFlag) {
      final int currentBonuses = await authRepository.getBonuses();
      final int currentTotal = (await getTotals())['withSale']?.toInt() ?? 0;
      usedBonuses = min(currentBonuses, currentTotal);
    } else {
      usedBonuses = 0;
    }
    return usedBonuses;
  }

  Future<Map<String, double>> getTotals() async {
    Map<String, double> totals = await cartRepository.getTotals();

    return {
      'withoutSale': totals['withoutSale'] as double,
      'withSale': totals['withSale'] as double,
      'total': (totals['withSale'] as double)-usedBonuses,
    };
  }

  bool getBonusFlag() {
    return useBonusesFlag;
  }
}