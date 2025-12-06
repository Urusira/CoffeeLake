class ShortUserData {
  String name;
  String phone;
  String email;
  String birthday;

  ShortUserData({
    required this.name,
    required this.phone,
    required this.email,
    required this.birthday,
  });

  Map<String, dynamic> serialize() => {
    'name': name,
    'phone': phone,
    'email': email,
    'birthday': birthday,
  };
}