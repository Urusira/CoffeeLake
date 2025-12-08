import 'package:coffee_lake_app/features/cart/domain/usecases/CartAddUseCase.dart';
import 'package:coffee_lake_app/features/cart/domain/usecases/CartGetUseCase.dart';
import 'package:coffee_lake_app/features/cart/domain/usecases/CartRemoveUseCase.dart';
import 'package:coffee_lake_app/features/product/data/models/CartProductData.dart';
import 'package:coffee_lake_app/features/profile/domain/usecases/GetProfileUseCase.dart';
import 'package:coffee_lake_app/features/profile/domain/usecases/ProfileGetBonusesUseCase.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/di.dart';
import '../../../services/ProfileService.dart';
import '../../order/domain/usecases/GetBonusesFlagUseCase.dart';
import '../../order/domain/usecases/OrderGetTotalsUseCase.dart';
import '../../order/domain/usecases/OrderGetUsedBonusesUseCase.dart';
import '../../order/domain/usecases/OrderPushUseCase.dart';
import '../../order/domain/usecases/OrderRecalUsedBonusesUseCase.dart';
import '../../order/domain/usecases/OrderToggleBonusesUseCase.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<StatefulWidget> createState() => CartState();
}

class CartState extends State<CartWidget> {
  bool useBonusFlag = di<GetBonusesFlagUseCase>().call();

  String formatPrice(num value) => value.toStringAsFixed(2);

  Widget? getSale(CartProductData product) {
    //Акция
    if (product.sale == 0) {
      return null;
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(32),
          color: Color(0xffF5A22D),
        ),
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        height: 24,
        child: Text(
          "-${product.sale}%",
          style: GoogleFonts.inknutAntiqua(fontSize: 14),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }
  }

  Widget? getCartList() {
    return FutureBuilder(
      future: di<CartGetUseCase>().call(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        }

        final cart = snapshot.data!;

        return Column(
          children: cart.map((product) {
            final priceWithSale =
                (product.price - product.price * (product.sale / 100)) *
                product.count;

            return Card(
              elevation: 0,
              color: Colors.transparent,
              child: Row(
                children: [
                  const Icon(Icons.coffee_outlined, size: 150),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      // Название
                      SizedBox(
                        width: 220,
                        child: Text(
                          product.name,
                          style: GoogleFonts.inknutAntiqua(
                            fontSize: 21,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),

                      // Объём
                      SizedBox(
                        width: 220,
                        child: Text(
                          "${product.vol}",
                          style: GoogleFonts.inknutAntiqua(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),

                      getSale(product) ?? const SizedBox(),

                      Row(
                        spacing: 16,
                        children: [
                          // Цена
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusGeometry.circular(32),
                              color: const Color(0xffDD9E44),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 2,
                            ),
                            height: 28,
                            width: 90,
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              "${formatPrice(priceWithSale)}р",
                              style: GoogleFonts.inknutAntiqua(fontSize: 14),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          // Счётчик
                          Stack(
                            children: [
                              Row(
                                spacing: 32,
                                children: [
                                  TextButton(
                                    onPressed: () async {
                                      await di<CartRemoveUseCase>().call(
                                        product,
                                      );
                                      await di<OrderRecalUsedBonusesUseCase>()
                                          .call();
                                      setState(() {});
                                    },
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      minimumSize: const Size(48, 28),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      backgroundColor: const Color(0xffD3BD9E),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 0,
                                      ),
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                    ),
                                    child: Text(
                                      '-',
                                      style: GoogleFonts.inknutAntiqua(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await di<CartAddUseCase>().call(product);
                                      await di<OrderRecalUsedBonusesUseCase>()
                                          .call();
                                      setState(() {});
                                    },
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      minimumSize: const Size(48, 28),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      backgroundColor: const Color(0xffD3BD9E),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 0,
                                      ),
                                      alignment: AlignmentDirectional.centerEnd,
                                    ),
                                    child: Text(
                                      '+',
                                      style: GoogleFonts.inknutAntiqua(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    32,
                                  ),
                                  color: const Color(0xffB09268),
                                ),
                                width: 81,
                                height: 28,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 2,
                                ),
                                margin: const EdgeInsets.only(left: 24),
                                child: Text(
                                  "${product.count}",
                                  style: GoogleFonts.inknutAntiqua(
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
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
              "Корзина",
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
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Column(
              spacing: 16,
              children: [
                Expanded(
                  child: (ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      ?getCartList(),

                      SizedBox(height: 32),

                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              enabled: true,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.inknutAntiqua(),
                              decoration: InputDecoration(
                                hintText: "Введите промокод",
                                hintStyle: GoogleFonts.inknutAntiqua(
                                  fontSize: 14,
                                ),
                                hintMaxLines: 1,
                              ),
                            ),
                          ),
                          SizedBox(height: 81),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xFFD3BD9E),
                            ),
                            child: Text(
                              "Применить",
                              style: GoogleFonts.inknutAntiqua(
                                color: Color(0xff444444),
                                fontSize: 14,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child:

                            FutureBuilder(
                              future: di<ProfileGetBonusesUseCase>().call(),
                              builder: (context, snapshot) {
                                return Text(
                                  "У вас есть бонусов: ${snapshot.data ?? 0}",
                                  style: GoogleFonts.inknutAntiqua(fontSize: 14),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                );
                              },
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              await di<OrderToggleBonusesUseCase>().call();
                              useBonusFlag = di<GetBonusesFlagUseCase>().call();
                              setState(() {});
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xFFD3BD9E),
                            ),
                            child: Text(
                              useBonusFlag ? "Оставить бонусы"
                                  : "Списать бонусы",
                              style: GoogleFonts.inknutAntiqua(
                                color: Color(0xff444444),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 190),
                    ],
                  )),
                ),
              ],
            ),
          ),
          //Фон итогов
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 200,
            child: (Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentGeometry.bottomCenter,
                  end: AlignmentGeometry.topCenter,
                  colors: <Color>[Color(0xffffffff), Color(0x00ffffff)],
                ),
              ),
            )),
          ),
          //Итоги
          Positioned(
            left: 8,
            right: 8,
            bottom: 64,
            height: 135,
            child: Card(
              child: Container(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Без скидки",
                          style: GoogleFonts.inknutAntiqua(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(
                          child: Text(
                            "..........................................................................................................",
                            style: GoogleFonts.inknutAntiqua(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        FutureBuilder(
                          future: di<OrderGetTotalsUseCase>().call(),
                          builder: (context, snapshot) {
                            return Text(
                              "${formatPrice(snapshot.data?['withoutSale'] ?? 0)}р",
                              style: GoogleFonts.inknutAntiqua(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "С учётом скидки",
                          style: GoogleFonts.inknutAntiqua(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(
                          child: Text(
                            "..........................................................................................................",
                            style: GoogleFonts.inknutAntiqua(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        FutureBuilder(
                          future: di<OrderGetTotalsUseCase>().call(),
                          builder: (context, snapshot) {
                            return Text(
                              "${formatPrice(snapshot.data?['withSale'] ?? 0)}р",
                              style: GoogleFonts.inknutAntiqua(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Спишется бонусов",
                          style: GoogleFonts.inknutAntiqua(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(
                          child: Text(
                            "..........................................................................................................",
                            style: GoogleFonts.inknutAntiqua(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        FutureBuilder(
                          future: di<OrderGetUsedBonusesUseCase>().call(),
                          builder: (context, snapshot) {
                            return Text(
                              "${snapshot.data!}",
                              style: GoogleFonts.inknutAntiqua(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    FutureBuilder(
                      future: di<OrderGetTotalsUseCase>().call(),
                      builder: (context, snapshot) {
                        return Text(
                          "${formatPrice(snapshot.data?['total'] ?? 0)}р",
                          style: GoogleFonts.inknutAntiqua(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if(await di<GetProfileUseCase>().call() == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Для заказа требуется авторизация',
                ),
              ),
            );
            return;
          }

          await di<OrderPushUseCase>().call();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Заказ оформлен, вам позвонят, когда он будет готов.',
              ),
            ),
          );
          setState(() {});
        },
        backgroundColor: Color(0xFFD3BD9E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(32),
        ),

        label: Text(
          "Заказать",
          style: GoogleFonts.inknutAntiqua(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Color(0xff444444),
          ),
        ),
      ),
    );
  }
}
