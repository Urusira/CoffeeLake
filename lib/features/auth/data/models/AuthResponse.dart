import 'package:coffee_lake_app/features/auth/data/models/UserData.dart';

class AuthResponse {
  final String token;
  final UserData user;

  AuthResponse({
    required this.token,
    required this.user,
  });

  factory AuthResponse.deserialize(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'],
      user: UserData.deserialize(json['user']),
    );
  }

  Map<String, dynamic> serialize() => {
    'token': token,
    'user': user.serialize(),
  };
}