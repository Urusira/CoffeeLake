import '../../../auth/domain/repositories/AuthRepository.dart';

class ProfileGetBonusesUseCase {
  AuthRepository authRepository;

  ProfileGetBonusesUseCase(this.authRepository);

  Future<int> call() async {
    return await authRepository.getBonuses();
  }
}