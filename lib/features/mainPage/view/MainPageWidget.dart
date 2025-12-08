import 'package:coffee_lake_app/features/auth/domain/repositories/AuthRepository.dart';
import 'package:coffee_lake_app/features/profile/domain/usecases/ProfileGetBonusesUseCase.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../core/di.dart';
import '../../../services/ProfileService.dart';
import '../../auth/data/models/UserData.dart';
import '../../menu/view/MenuWidget.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPageWidget> {
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
              "Главная",
              style: GoogleFonts.inknutAntiqua(
                color: Color(0xff444444),
                fontSize: 18,
              ),
            ),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MenuWidget()),
              );
              setState(() {});
          },
          icon: Icon(Icons.shopping_cart),
        ),
        backgroundColor: Color(0xFFD3BD9E),
        actions: [
          IconButton(
            onPressed: () async {
              await ProfileService.openProfile(context);
              setState(() {});
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          spacing: 16,
          children: [
            FutureBuilder(
              future: di<AuthRepository>().getProfile(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Card(
                    color: Color(0xffd9d9d9),
                    shadowColor: Colors.black,
                    elevation: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container (
                          padding: EdgeInsets.symmetric(vertical: 48),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 300,
                                child: Text(
                                  "Зарегистрируйтесь, накапливайте баллы - получайте бесплатный кофе!",
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  style: GoogleFonts.inknutAntiqua(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  UserData? currentUser = snapshot.data;

                  return Column(
                    spacing: 8,
                    children: [
                      Text (
                        "Добро пожаловать,\n${currentUser?.name}!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inknutAntiqua(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Card(
                        color: Color(0xffd9d9d9),
                        shadowColor: Colors.black,
                        elevation: 4,
                        child: Row(
                          spacing: 16,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              spacing: 24,
                              children: [
                                SizedBox(
                                  width: 170,
                                  child: Text(
                                    "Покажите QR-код нашему бариста",
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: GoogleFonts.inknutAntiqua(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 170,
                                  child: FutureBuilder(
                                    future: di<ProfileGetBonusesUseCase>().call(),
                                    builder: (context, snapshot) {
                                    return Text(
                                      "Ваши бонусы: ${snapshot.data ?? 0}",
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      style: GoogleFonts.inknutAntiqua(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    );
                                  })
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    "Вам доступен кофе за баллы!",
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: GoogleFonts.inknutAntiqua(
                                      fontSize: 12,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            QrImageView(data: "ТЫ ЧЕВО НАДЕЛАЛ", size: 200),
                          ],
                        ),
                      ),
                    ]
                  );
                }
              },
            ),

            SizedBox(
              height: 205,
              child: (PageView(
                scrollDirection: Axis.horizontal,
                children: [
                  Card(
                    shadowColor: Colors.black,
                    elevation: 4,
                    color: Color(0xffd9d9d9),
                    child: Row(
                      spacing: 16,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.coffee_rounded, size: 150),
                        Column(
                          spacing: 12,
                          children: [
                            SizedBox(height: 2),
                            SizedBox(
                              width: 220,
                              child: Text(
                                loremIpsum(words: 2),
                                style: GoogleFonts.inknutAntiqua(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff222222),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              width: 220,
                              child: Text(
                                loremIpsum(words: 50),
                                style: GoogleFonts.inknutAntiqua(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff222222),
                                ),
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              width: 180,
                              child: Text(
                                "Перейти",
                                style: GoogleFonts.inknutAntiqua(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff444444),
                                  decoration: TextDecoration.underline,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Card(
                    shadowColor: Colors.black,
                    elevation: 4,
                    color: Color(0xffd9d9d9),
                    child: Row(
                      spacing: 16,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.coffee_rounded, size: 150),
                        Column(
                          spacing: 12,
                          children: [
                            SizedBox(height: 2),
                            SizedBox(
                              width: 220,
                              child: Text(
                                loremIpsum(words: 2),
                                style: GoogleFonts.inknutAntiqua(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff222222),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              width: 220,
                              child: Text(
                                loremIpsum(words: 50),
                                style: GoogleFonts.inknutAntiqua(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff222222),
                                ),
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              width: 180,
                              child: Text(
                                "Перейти",
                                style: GoogleFonts.inknutAntiqua(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff444444),
                                  decoration: TextDecoration.underline,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Card(
                    shadowColor: Colors.black,
                    elevation: 4,
                    color: Color(0xffd9d9d9),
                    child: Row(
                      spacing: 16,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.coffee_rounded, size: 150),
                        Column(
                          spacing: 12,
                          children: [
                            SizedBox(height: 2),
                            SizedBox(
                              width: 220,
                              child: Text(
                                loremIpsum(words: 2),
                                style: GoogleFonts.inknutAntiqua(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff222222),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              width: 220,
                              child: Text(
                                loremIpsum(words: 50),
                                style: GoogleFonts.inknutAntiqua(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff222222),
                                ),
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              width: 180,
                              child: Text(
                                "Перейти",
                                style: GoogleFonts.inknutAntiqua(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff444444),
                                  decoration: TextDecoration.underline,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
