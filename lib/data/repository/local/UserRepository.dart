import '../../models/user/UserData.dart';

class UserRepository {
  static UserData? currentUser;

  static void LogIn(String phone) {
    currentUser = UserData(phone: phone, name: '', email: '', birthday: '', bonuses: 250);
  }

  static void LogOut() {
    currentUser = null;
  }
}