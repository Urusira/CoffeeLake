import 'package:coffee_lake_app/features/auth/data/datasources/AuthRemoteDataSource.dart';
import 'package:coffee_lake_app/features/auth/data/models/AuthResponse.dart';
import 'package:coffee_lake_app/features/auth/data/models/UserData.dart';
import 'package:coffee_lake_app/features/profile/models/ShortUserData.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/di.dart';

class AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepository(this.remoteDataSource);

  Future<AuthResponse> auth(String phone) async {
    final response = await remoteDataSource.auth(phone);

    await di<FlutterSecureStorage>().write(key: 'poki', value: response.token);
    return response;
  }

  void logout() async {
    di<FlutterSecureStorage>().delete(key: 'poki');
  }

  Future<UserData?> getProfile() async {
    return await remoteDataSource.getProfile();
  }

  Future<String?> getToken() async {
    return di<FlutterSecureStorage>().read(key: 'poki');
  }

  Future<void> updateProfile(ShortUserData data) async {
    remoteDataSource.updateProfile(data);
  }

  Future<int> getBonuses() async {
    return await remoteDataSource.getBonuses();
  }


}
