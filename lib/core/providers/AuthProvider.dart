import 'package:coffee_lake_app/features/auth/data/models/UserData.dart';
import 'package:flutter/cupertino.dart';

import '../../features/profile/domain/usecases/GetProfileUseCase.dart';
import '../di.dart';

class AuthProvider extends ChangeNotifier {
  UserData? user;

  Future<bool> checkAuth() async {
    try {
      user = await di<GetProfileUseCase>().call();
      return user != null;
    } catch (e) {
      user = null;
      return false;
    }
  }
}
