import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

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
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row (
              spacing: 16,
              children: [
                Column(
                  children: [
                    Stack (
                      children: [
                        Container(
                          width: 125,
                          height: 125,
                          color: Color(0xff9f9f9f),
                        ),
                        Icon(
                          Icons.person,
                          size: 125,
                        )
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
                      )
                    )
                  ]
                ),
                Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Имя пользователя",
                      style: GoogleFonts.inknutAntiqua(
                        fontSize: 16,
                        color: Color(0xff333333),
                      ),
                    ),
                    Text(
                      "Номер телефона",
                      style: GoogleFonts.inknutAntiqua(
                        fontSize: 16,
                        color: Color(0xff333333),
                      ),
                    ),
                    Text(
                      "Адрес электронной почты",
                      style: GoogleFonts.inknutAntiqua(
                        fontSize: 16,
                        color: Color(0xff333333),
                      ),
                    ),
                    Text(
                      "День рождения",
                      style: GoogleFonts.inknutAntiqua(
                        fontSize: 16,
                        color: Color(0xff333333),
                      ),
                    ),
                    Row (
                      children: [
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap
                          ),
                          child: Text(
                            "Редактировать данные",
                            style: GoogleFonts.inknutAntiqua(
                                fontSize: 12,
                                color: Color(0xff666666),
                                decoration: TextDecoration.underline
                            ),
                          )
                        )
                      ],
                    )
                  ],
                )
              ],
            ),

            Expanded(child: Container(),),
          ]
        ),
      )
    );
  }
}