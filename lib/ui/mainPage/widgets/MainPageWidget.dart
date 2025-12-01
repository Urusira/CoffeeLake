import 'package:coffee_lake_app/data/repository/local/UserRepository.dart';
import 'package:coffee_lake_app/ui/auth/widgets/AuthWidget.dart';
import 'package:coffee_lake_app/ui/profile/widgets/ProfileWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../menu/widgets/MenuWidget.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPageWidget> {
  Widget? getQrCard() {
    if (UserRepository.currentUser != null) {
      return Card(
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
                  child: Text(
                    "Ваши бонусы: ${UserRepository.currentUser?.bonuses}",
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: GoogleFonts.inknutAntiqua(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
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
      );
    } else {
      return null;
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
          onPressed: () {
            setState(() {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MenuWidget()),
              );
            });
          },
          icon: Icon(Icons.shopping_cart),
        ),
        backgroundColor: Color(0xFFD3BD9E),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (UserRepository.currentUser == null) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AuthWidget()),
                  );
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ProfileWidget(),
                    ),
                  );
                }
              });
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
            ?getQrCard(),
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
