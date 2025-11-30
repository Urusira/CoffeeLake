import '../../models/user/UserData.dart';

class UserRepository {
  static UserData? currentUser;

  static void LogIn(String phone, ) {
    currentUser = UserData(phone: phone, name: '', email: '', birthday: '');
  }

  static void LogOut() {
    currentUser = null;
  }
}