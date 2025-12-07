import 'package:coffee_lake_app/features/cart/domain/repositories/CartRepository.dart';
import 'package:coffee_lake_app/features/auth/domain/repositories/AuthRepository.dart';

class OrderService {
  CartRepository cartRepository;
  AuthRepository authRepository;

  OrderService(this.cartRepository, this.authRepository);


}