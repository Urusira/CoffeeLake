import '../repositories/CartRepository.dart';

class CartCountProductUseCase {
  CartRepository cartRepository;

  CartCountProductUseCase(this.cartRepository);


   Future<int> call(int productId, double productVol) async {
     return cartRepository.count(productId, productVol);
   }
}