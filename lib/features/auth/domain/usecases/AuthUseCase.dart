import 'package:coffee_lake_app/features/auth/domain/repositories/AuthRepository.dart';

import '../../data/models/AuthResponse.dart';

class AuthUseCase {
  final AuthRepository repository;

  AuthUseCase(this.repository);

  Future<AuthResponse> call(String phone) => repository.auth(phone);
}
