import 'package:coffee_lake_app/features/cart/view/CartWidget.dart';
import 'package:coffee_lake_app/features/menu/domain/usecases/GetMenuUseCase.dart';
import 'package:coffee_lake_app/features/menu/view/ProductDetailsWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

import '../../../core/di.dart';
import '../../../services/ProfileService.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<StatefulWidget> createState() => MenuState();
}

class MenuState extends State<MenuWidget> {
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
              "Наше меню",
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
            onPressed: () async {
              await ProfileService.openProfile(context);
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),

      // Тело
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          spacing: 16,
          children: [
            Expanded(
              child: (ListView(
                scrollDirection: Axis.vertical,
                children: [
                  //Контейнер с каруселью акций
                  SizedBox(
                    height: 205,
                    child:
                        (
                        //Карусель акций
                        PageView(
                          children: [
                            //Акция 1
                            Card(
                              shadowColor: Colors.black,
                              elevation: 5,
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
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //Акция 2
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
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //Акция 3
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
                                            decoration:
                                                TextDecoration.underline,
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

                  //Отступ сверху
                  SizedBox(height: 32),

                  //Категория товара
                  Text(
                    "Кофе на вынос",
                    style: GoogleFonts.inknutAntiqua(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),

                  FutureBuilder(
                    future: di<GetMenuUseCase>().call(),
                    builder: (context, snapshot) {
                      try {
                        if (snapshot.hasData) {
                          return Column(
                            children: snapshot.data!.menuList
                                .map(
                                  (item) => Card(
                                    elevation: 0,
                                    color: Colors.transparent,
                                    child: Row(
                                      children: [
                                        //Фото товара
                                        Icon(Icons.coffee_outlined, size: 150),

                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          spacing: 4,
                                          children: [
                                            //Название
                                            SizedBox(
                                              width: 220,
                                              child: Text(
                                                item.name,
                                                style:
                                                    GoogleFonts.inknutAntiqua(
                                                      fontSize: 21,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                            ),

                                            //Описание
                                            SizedBox(
                                              width: 220,
                                              child: Text(
                                                item.description,
                                                style:
                                                    GoogleFonts.inknutAntiqua(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                textAlign: TextAlign.justify,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ),

                                            //Отступ
                                            SizedBox(height: 4),

                                            //Кнопка "В корзину"
                                            ElevatedButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) => Dialog(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    child: ProductDetailsWidget(
                                                      productId: item.id,
                                                    ),
                                                  ),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(32),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 12,
                                                  vertical: 0,
                                                ),
                                                backgroundColor: Color(
                                                  0x70ffffff,
                                                ),
                                              ),
                                              child: Text(
                                                "От ${item.basePrice.first} р",
                                                style:
                                                    GoogleFonts.inknutAntiqua(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Color(0xff222222),
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          );
                        } else {
                          return SizedBox(
                            height: 350,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                      } catch (_) {
                        return SizedBox(
                          width: 200,
                          height: 200,
                          child: Text("Ошибка загрузки данных"),
                        );
                      }
                    },
                  ),

                  SizedBox(height: 81),
                ],
              )),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const CartWidget()));
        },
        backgroundColor: Color(0xFFD3BD9E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(32),
        ),
        icon: Icon(Icons.coffee_sharp, color: Colors.black, size: 42),
        label: Text(
          "Заказать",
          style: GoogleFonts.inknutAntiqua(
            fontSize: 21,
            fontWeight: FontWeight.w400,
            color: Color(0xff444444),
          ),
        ),
      ),
    );
  }
}
