import 'package:coffee_lake_app/data/repository/local/UserRepository.dart';
import 'package:coffee_lake_app/ui/profile/widgets/ProfileWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String phone = "";

    bool isValidPhone(String phone) {
      final regex = RegExp(r'^[\d\+]{10,15}$');
      return regex.hasMatch(phone.replaceAll(' ', ''));
    }

    bool AuthHandler() {
      if(isValidPhone(phone)) {
        UserRepository.LogIn(phone);
        return true;
      }
      return false;
    }

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
              "Авторизация",
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
      ),

      // Тело
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 160),
            width: 300,
            child: Card(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  spacing: 48,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Авторизация",
                          style: GoogleFonts.inknutAntiqua(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        enabled: true,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.inknutAntiqua(fontSize: 14),
                        decoration: InputDecoration(
                          hintText: "Номер телефона",
                          hintStyle: GoogleFonts.inknutAntiqua(fontSize: 14),
                        ),
                        validator: (value) {
                          if (value == null || !isValidPhone(value)) {
                            return 'Введите корректный номер';
                          }
                          return null;
                        },
                        onChanged: (value) => phone = value,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if(AuthHandler()) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const ProfileWidget(),
                            ),
                          );
                        }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFD3BD9E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(6),
                        ),
                      ),
                      child: Text(
                        "Войти",
                        style: GoogleFonts.inknutAntiqua(
                          fontSize: 16,
                          color: Color(0xff444444),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(child: Container()),
        ],
      ),
    );
  }
}
