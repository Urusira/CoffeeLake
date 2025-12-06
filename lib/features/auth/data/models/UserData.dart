class UserData {
  String name;
  String phone;
  String email;
  String birthday;
  int bonuses;

  UserData({
    required this.name,
    required this.phone,
    required this.email,
    required this.birthday,
    required this.bonuses,
  });

  factory UserData.deserialize(Map<String, dynamic> json) {
    return UserData(
        name: json['name'].toString(),
        phone: json['phone'].toString(),
        email: json['email'].toString(),
        birthday: json['birthday'].toString(),
        bonuses: json['bonuses'] as int,
    );
  }

  Map<String, dynamic> serialize() => {
    'name': name,
    'phone': phone,
    'email': email,
    'birthday': birthday,
    'bonuses': bonuses,
  };
}