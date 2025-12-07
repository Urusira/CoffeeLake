import 'package:coffee_lake_app/features/auth/data/models/AuthResponse.dart';
import 'package:coffee_lake_app/features/auth/data/models/UserData.dart';
import 'package:coffee_lake_app/features/profile/models/ShortUserData.dart';

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

  Future<UserData?> getProfile() async {
    try {
      final response = await di<Network>().dio.get('/profile');
      return UserData.deserialize(response.data);
    }
    catch (_) {
      return null;
    }
  }

  Future<void> updateProfile(ShortUserData user) async {
    await di<Network>().dio.post(
        '/profile/edit',
        data: user.serialize(),
    );
  }

  Future<int> getBonuses() async {
    var response = await di<Network>().dio.get(
      '/profile/getb'
    );
    return response.data['bonuses'] as int;
  }
}
