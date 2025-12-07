import 'package:coffee_lake_app/features/product/data/models/CartProductData.dart';

import '../repositories/CartRepository.dart';

class CartRemoveUseCase {
  CartRepository cartRepository;

  CartRemoveUseCase(this.cartRepository);

  Future<void> call(CartProductData product) async {
    cartRepository.remove(product);
  }
}