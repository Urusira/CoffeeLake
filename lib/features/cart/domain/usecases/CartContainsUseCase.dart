import '../repositories/CartRepository.dart';

class CartContainsUseCase {
  CartRepository cartRepository;

  CartContainsUseCase(this.cartRepository);

  Future<bool> call(int productId, double productVol) async {
    //TODO: ДОДЕЛАТЬ ГОВНО
    throw Exception("need realize todo!");
    asdf
  }
}