import 'package:coffee_lake_app/features/product/data/models/CartProductData.dart';

import '../repositories/CartRepository.dart';

class CartGetUseCase {
  CartRepository cartRepository;

  CartGetUseCase(this.cartRepository);

  Future<List<CartProductData>> call() async {
    return cartRepository.getCart();
  }
}