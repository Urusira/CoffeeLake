import '../repositories/CartRepository.dart';

class CartContainsUseCase {
  CartRepository cartRepository;

  CartContainsUseCase(this.cartRepository);

  Future<bool> call(int productId, double productVol) async {
    return cartRepository.contains(productId, productVol);
  }
}