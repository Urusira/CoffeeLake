import 'package:coffee_lake_app/features/auth/domain/repositories/AuthRepository.dart';
import 'package:coffee_lake_app/features/auth/domain/usecases/AuthUseCase.dart';
import 'package:coffee_lake_app/features/profile/view/ProfileWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/di.dart';
import '../../mainPage/view/MainPageWidget.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<StatefulWidget> createState() => AuthState();
}

class AuthState extends State<AuthWidget>{
  final phoneController = TextEditingController();

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
                        controller: phoneController,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        try {
                          await di<AuthUseCase>().call(phoneController.text);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => ProfileWidget())
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Ошибка авторизации: $e'))
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
