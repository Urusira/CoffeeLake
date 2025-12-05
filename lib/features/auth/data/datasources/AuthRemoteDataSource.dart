import 'package:coffee_lake_app/features/auth/data/models/AuthResponse.dart';
import 'package:coffee_lake_app/features/auth/data/models/UserData.dart';

import '../../../../core/Network.dart';
import '../../../../core/di.dart';

class AuthRemoteDataSource {
  Future<AuthResponse> auth(String phone) async {
    final response = await di<Network>().dio.post(
      '/auth',
      data: {'phone': phone},
    );
    return AuthResponse.deserialize(response.data);
  }

  Future<UserData> getProfile() async {
    final response = await di<Network>().dio.get('/profile');
    return UserData.deserialize(response.data);
  }
}
