import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key});

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
              SizedBox(height: 2,),
              Text(
                "Авторизация",
                style: GoogleFonts.inknutAntiqua(
                    color: Color(0xff444444),
                    fontSize: 18
                ),
              ),
            ]
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        backgroundColor: Color(0xFFD3BD9E),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.person))
        ],
      ),

      // Тело
      body: Column(
        children: [
          Container (
            margin: EdgeInsets.symmetric(vertical: 160),
            width: 300,
            child: Card (
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  spacing: 48,
                  children: [
                    Row (
                      children: [
                        Text (
                          "Авторизация",
                          style: GoogleFonts.inknutAntiqua(
                            fontSize: 24,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ]
                    ),
                    SizedBox (
                      width: 200,
                      child: TextField (
                        enabled: true,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.inknutAntiqua(
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          hintText: "Номер телефона",
                          hintStyle: GoogleFonts.inknutAntiqua(
                            fontSize: 14
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFD3BD9E),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(6))
                      ),
                      child: Text(
                        "Войти",
                        style: GoogleFonts.inknutAntiqua(
                          fontSize: 16,
                          color: Color(0xff444444),
                        ),
                      )
                    )
                  ]
                )
              )
            ),
          ),

          Expanded(child: Container(),),
        ]
      ),

    );
  }
}