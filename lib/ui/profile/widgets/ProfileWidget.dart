import 'package:coffee_lake_app/data/repository/local/UserRepository.dart';
import 'package:coffee_lake_app/ui/auth/widgets/AuthWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<StatefulWidget> createState() => ProfileState();
}

class ProfileState extends State<ProfileWidget> {
  bool editing = false;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final birthdayController = TextEditingController();

  @override
  void initState() {
    super.initState();
    LoadData();
  }

  void LoadData() {
    final user = UserRepository.currentUser;
    nameController.text = user?.name ?? '';
    phoneController.text = user?.phone ?? '';
    emailController.text = user?.email ?? '';
    birthdayController.text = user?.birthday ?? '';
  }

  void SaveData() {
    UserRepository.currentUser?.name = nameController.text;
    UserRepository.currentUser?.phone = phoneController.text;
    UserRepository.currentUser?.email = emailController.text;
    UserRepository.currentUser?.birthday = birthdayController.text;
  }

  Future<void> selectBirthday() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        birthdayController.text =
            "${picked.year}.${picked.month}.${picked.day}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "Coffee Lake",
              style: GoogleFonts.inknutAntiqua(
                color: Color(0xff444444),
                fontSize: 24,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "Профиль",
              style: GoogleFonts.inknutAntiqua(
                color: Color(0xff444444),
                fontSize: 18,
              ),
            ),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Color(0xFFD3BD9E),
        actions: [
          IconButton(
            onPressed: () {
              UserRepository.LogOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const AuthWidget()),
              );
            },
            icon: Icon(Icons.output),
          ),
        ],
      ),

      // Тело
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              spacing: 16,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 125,
                          height: 125,
                          color: Color(0xff9f9f9f),
                        ),
                        Icon(Icons.person, size: 125),
                      ],
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        "Нажмите для изменения",
                        style: GoogleFonts.inknutAntiqua(
                          fontSize: 12,
                          color: Color(0xff666666),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 235,
                      child: TextField(
                        controller: nameController,
                        enabled: editing,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          hintText: "Имя пользователя",
                        ),
                        style: GoogleFonts.inknutAntiqua(
                          fontSize: 16,
                          color: Color(0xff333333),
                        ),
                      ),
                    ),
                    Container(
                      width: 235,
                      child: TextField(
                        controller: phoneController,
                        enabled: editing,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          hintText: "Номер телефона",
                        ),
                        style: GoogleFonts.inknutAntiqua(
                          fontSize: 16,
                          color: Color(0xff333333),
                        ),
                      ),
                    ),
                    Container(
                      width: 235,
                      child: TextField(
                        controller: emailController,
                        enabled: editing,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          hintText: "Адрес электронной почты",
                        ),
                        style: GoogleFonts.inknutAntiqua(
                          fontSize: 16,
                          color: Color(0xff333333),
                        ),
                      ),
                    ),
                    Container(
                      width: 235,
                      child: editing
                          ? TextField(
                              controller: birthdayController,
                              readOnly: true,
                              onTap: selectBirthday,
                              decoration: InputDecoration(
                                hintText: 'Нажмите для выбора даты',
                                hintStyle: GoogleFonts.inknutAntiqua(
                                  fontSize: 16,
                                  color: Color(0xff333333),
                                ),
                              ),
                              style: GoogleFonts.inknutAntiqua(
                                fontSize: 16,
                                color: Color(0xff333333),
                              ),
                            )
                          : Text(
                              "${UserRepository.currentUser?.birthday}",
                              style: GoogleFonts.inknutAntiqua(
                                fontSize: 16,
                                color: Color(0xff333333),
                              ),
                            ),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              editing = !editing;
                              if (!editing) {
                                SaveData();
                                LoadData();
                              }
                            });
                          },
                          style: TextButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            editing
                                ? "Сохранить изменения"
                                : "Редактировать данные",
                            style: GoogleFonts.inknutAntiqua(
                              fontSize: 12,
                              color: Color(0xff666666),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
