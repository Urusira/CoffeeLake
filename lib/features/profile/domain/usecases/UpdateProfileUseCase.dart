import '../../../../core/di.dart';
import '../../../auth/domain/repositories/AuthRepository.dart';
import '../../models/ShortUserData.dart';

class UpdateProfileUseCase {
  final AuthRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<void> call(String name, phone, email, birthday) async {
    await di<AuthRepository>().updateProfile(
      ShortUserData(name: name, phone: phone, email: email, birthday: birthday),
    );
  }
}
