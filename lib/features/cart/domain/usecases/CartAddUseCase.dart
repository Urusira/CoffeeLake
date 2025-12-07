import 'package:coffee_lake_app/features/cart/domain/repositories/CartRepository.dart';

import '../../../product/data/models/CartProductData.dart';

class CartAddUseCase {
  CartRepository cartRepository;

  CartAddUseCase(this.cartRepository);


  Future<void> call(CartProductData product) async {
    cartRepository.add(product);
  }
}