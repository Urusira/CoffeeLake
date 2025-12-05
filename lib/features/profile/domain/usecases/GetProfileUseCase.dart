import 'package:coffee_lake_app/features/auth/data/models/UserData.dart';

import '../../../auth/domain/repositories/AuthRepository.dart';

class GetProfileUseCase {
  final AuthRepository repository;

  GetProfileUseCase(this.repository);

  Future<UserData> call() => repository.getProfile();
}
