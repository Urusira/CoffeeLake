import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

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
                "Корзина",
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
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Column(
              spacing: 16,
              children: [
                Expanded (
                  child: (
                    ListView (
                      scrollDirection: Axis.vertical,
                      children: [
                        //Карточка товара 0
                        Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              //Фото товара
                              Icon(
                                Icons.coffee_outlined,
                                size: 150,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 4,
                                children: [
                                  //Название
                                  SizedBox (
                                      width: 220,
                                      child:
                                      Text (
                                        loremIpsum(words: 2),
                                        style: GoogleFonts.inknutAntiqua(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )
                                  ),

                                  //Объём
                                  SizedBox (
                                    width: 220,
                                    child:
                                    Text (
                                      "0,296мг ",
                                      style: GoogleFonts.inknutAntiqua(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),

                                  //Акция
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadiusGeometry.circular(32),
                                        color: Color(0xffF5A22D)
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    height: 24,
                                    child:
                                    Text(
                                      "-69%",
                                      style: GoogleFonts.inknutAntiqua(
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  Row(
                                    spacing: 32,
                                    children: [

                                      //Цена
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadiusGeometry.circular(32),
                                            color: Color(0xffDD9E44)
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                        height: 28,
                                        child:
                                        Text(
                                          "999р",
                                          style: GoogleFonts.inknutAntiqua(
                                            fontSize: 16,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),

                                      //Счётчик
                                      Stack (
                                        children: [
                                          Row(
                                              spacing: 32,
                                              children: [
                                                TextButton(
                                                    onPressed: () {},
                                                    style: TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(32),
                                                        ),
                                                        minimumSize: Size(48, 28),
                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        backgroundColor: Color(0xffD3BD9E),
                                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                                        alignment: AlignmentDirectional.centerStart
                                                    ),
                                                    child: Text(
                                                      '-',
                                                      style: GoogleFonts.inknutAntiqua(
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                ),

                                                TextButton(
                                                    onPressed: () {},

                                                    style: TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(32),
                                                        ),
                                                        minimumSize: Size(48, 28),
                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        backgroundColor: Color(0xffD3BD9E),
                                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                                        alignment: AlignmentDirectional.centerEnd
                                                    ),
                                                    child: Text(
                                                      '+',
                                                      style: GoogleFonts.inknutAntiqua(
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                ),
                                              ]
                                          ),

                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadiusGeometry.circular(32),
                                                  color: Color(0xffB09268)
                                              ),
                                              width: 81,
                                              height: 28,
                                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                              margin: EdgeInsets.fromLTRB(24, 0, 0, 0),
                                              child: Text(
                                                '69 шт',
                                                style: GoogleFonts.inknutAntiqua(
                                                  fontSize: 15,
                                                ),
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              )
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        //Карточка товара 1
                        Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              //Фото товара
                              Icon(
                                Icons.coffee_outlined,
                                size: 150,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 4,
                                children: [
                                  //Название
                                  SizedBox (
                                      width: 220,
                                      child:
                                      Text (
                                        loremIpsum(words: 2),
                                        style: GoogleFonts.inknutAntiqua(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )
                                  ),

                                  //Объём
                                  SizedBox (
                                    width: 220,
                                    child:
                                    Text (
                                      "0,296мг ",
                                      style: GoogleFonts.inknutAntiqua(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),

                                  //Акция
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadiusGeometry.circular(32),
                                        color: Color(0xffF5A22D)
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    height: 24,
                                    child:
                                    Text(
                                      "-69%",
                                      style: GoogleFonts.inknutAntiqua(
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  Row(
                                    spacing: 32,
                                    children: [

                                      //Цена
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadiusGeometry.circular(32),
                                            color: Color(0xffDD9E44)
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                        height: 28,
                                        child:
                                        Text(
                                          "999р",
                                          style: GoogleFonts.inknutAntiqua(
                                            fontSize: 16,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),

                                      //Счётчик
                                      Stack (
                                        children: [
                                          Row(
                                              spacing: 32,
                                              children: [
                                                TextButton(
                                                    onPressed: () {},
                                                    style: TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(32),
                                                        ),
                                                        minimumSize: Size(48, 28),
                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        backgroundColor: Color(0xffD3BD9E),
                                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                                        alignment: AlignmentDirectional.centerStart
                                                    ),
                                                    child: Text(
                                                      '-',
                                                      style: GoogleFonts.inknutAntiqua(
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                ),

                                                TextButton(
                                                    onPressed: () {},

                                                    style: TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(32),
                                                        ),
                                                        minimumSize: Size(48, 28),
                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        backgroundColor: Color(0xffD3BD9E),
                                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                                        alignment: AlignmentDirectional.centerEnd
                                                    ),
                                                    child: Text(
                                                      '+',
                                                      style: GoogleFonts.inknutAntiqua(
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                ),
                                              ]
                                          ),

                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadiusGeometry.circular(32),
                                                  color: Color(0xffB09268)
                                              ),
                                              width: 81,
                                              height: 28,
                                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                              margin: EdgeInsets.fromLTRB(24, 0, 0, 0),
                                              child: Text(
                                                '69 шт',
                                                style: GoogleFonts.inknutAntiqua(
                                                  fontSize: 15,
                                                ),
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              )
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        //Карточка товара 2
                        Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              //Фото товара
                              Icon(
                                Icons.coffee_outlined,
                                size: 150,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 4,
                                children: [
                                  //Название
                                  SizedBox (
                                      width: 220,
                                      child:
                                      Text (
                                        loremIpsum(words: 2),
                                        style: GoogleFonts.inknutAntiqua(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )
                                  ),

                                  //Объём
                                  SizedBox (
                                    width: 220,
                                    child:
                                    Text (
                                      "0,296мг ",
                                      style: GoogleFonts.inknutAntiqua(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),

                                  //Акция
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadiusGeometry.circular(32),
                                        color: Color(0xffF5A22D)
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    height: 24,
                                    child:
                                    Text(
                                      "-69%",
                                      style: GoogleFonts.inknutAntiqua(
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  Row(
                                    spacing: 32,
                                    children: [

                                      //Цена
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadiusGeometry.circular(32),
                                            color: Color(0xffDD9E44)
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                        height: 28,
                                        child:
                                        Text(
                                          "999р",
                                          style: GoogleFonts.inknutAntiqua(
                                            fontSize: 16,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),

                                      //Счётчик
                                      Stack (
                                        children: [
                                          Row(
                                              spacing: 32,
                                              children: [
                                                TextButton(
                                                    onPressed: () {},
                                                    style: TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(32),
                                                        ),
                                                        minimumSize: Size(48, 28),
                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        backgroundColor: Color(0xffD3BD9E),
                                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                                        alignment: AlignmentDirectional.centerStart
                                                    ),
                                                    child: Text(
                                                      '-',
                                                      style: GoogleFonts.inknutAntiqua(
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                ),

                                                TextButton(
                                                    onPressed: () {},

                                                    style: TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(32),
                                                        ),
                                                        minimumSize: Size(48, 28),
                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        backgroundColor: Color(0xffD3BD9E),
                                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                                        alignment: AlignmentDirectional.centerEnd
                                                    ),
                                                    child: Text(
                                                      '+',
                                                      style: GoogleFonts.inknutAntiqua(
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                ),
                                              ]
                                          ),

                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadiusGeometry.circular(32),
                                                  color: Color(0xffB09268)
                                              ),
                                              width: 81,
                                              height: 28,
                                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                              margin: EdgeInsets.fromLTRB(24, 0, 0, 0),
                                              child: Text(
                                                '69 шт',
                                                style: GoogleFonts.inknutAntiqua(
                                                  fontSize: 15,
                                                ),
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              )
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        //Карточка товара 3
                        Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              //Фото товара
                              Icon(
                                Icons.coffee_outlined,
                                size: 150,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 4,
                                children: [
                                  //Название
                                  SizedBox (
                                      width: 220,
                                      child:
                                      Text (
                                        loremIpsum(words: 2),
                                        style: GoogleFonts.inknutAntiqua(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )
                                  ),

                                  //Объём
                                  SizedBox (
                                    width: 220,
                                    child:
                                    Text (
                                      "0,296мг ",
                                      style: GoogleFonts.inknutAntiqua(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),

                                  //Акция
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadiusGeometry.circular(32),
                                        color: Color(0xffF5A22D)
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    height: 24,
                                    child:
                                    Text(
                                      "-69%",
                                      style: GoogleFonts.inknutAntiqua(
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  Row(
                                    spacing: 32,
                                    children: [

                                      //Цена
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadiusGeometry.circular(32),
                                            color: Color(0xffDD9E44)
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                        height: 28,
                                        child:
                                        Text(
                                          "999р",
                                          style: GoogleFonts.inknutAntiqua(
                                            fontSize: 16,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),

                                      //Счётчик
                                      Stack (
                                        children: [
                                          Row(
                                              spacing: 32,
                                              children: [
                                                TextButton(
                                                    onPressed: () {},
                                                    style: TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(32),
                                                        ),
                                                        minimumSize: Size(48, 28),
                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        backgroundColor: Color(0xffD3BD9E),
                                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                                        alignment: AlignmentDirectional.centerStart
                                                    ),
                                                    child: Text(
                                                      '-',
                                                      style: GoogleFonts.inknutAntiqua(
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                ),

                                                TextButton(
                                                    onPressed: () {},

                                                    style: TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(32),
                                                        ),
                                                        minimumSize: Size(48, 28),
                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        backgroundColor: Color(0xffD3BD9E),
                                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                                        alignment: AlignmentDirectional.centerEnd
                                                    ),
                                                    child: Text(
                                                      '+',
                                                      style: GoogleFonts.inknutAntiqua(
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                ),
                                              ]
                                          ),

                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadiusGeometry.circular(32),
                                                  color: Color(0xffB09268)
                                              ),
                                              width: 81,
                                              height: 28,
                                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                              margin: EdgeInsets.fromLTRB(24, 0, 0, 0),
                                              child: Text(
                                                '69 шт',
                                                style: GoogleFonts.inknutAntiqua(
                                                  fontSize: 15,
                                                ),
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              )
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        //Карточка товара 4
                        Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              //Фото товара
                              Icon(
                                Icons.coffee_outlined,
                                size: 150,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 4,
                                children: [
                                  //Название
                                  SizedBox (
                                      width: 220,
                                      child:
                                      Text (
                                        loremIpsum(words: 2),
                                        style: GoogleFonts.inknutAntiqua(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )
                                  ),

                                  //Объём
                                  SizedBox (
                                    width: 220,
                                    child:
                                    Text (
                                      "0,296мг ",
                                      style: GoogleFonts.inknutAntiqua(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),

                                  //Акция
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadiusGeometry.circular(32),
                                        color: Color(0xffF5A22D)
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    height: 24,
                                    child:
                                    Text(
                                      "-69%",
                                      style: GoogleFonts.inknutAntiqua(
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  Row(
                                    spacing: 32,
                                    children: [

                                      //Цена
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadiusGeometry.circular(32),
                                            color: Color(0xffDD9E44)
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                        height: 28,
                                        child:
                                        Text(
                                          "999р",
                                          style: GoogleFonts.inknutAntiqua(
                                            fontSize: 16,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),

                                      //Счётчик
                                      Stack (
                                        children: [
                                          Row(
                                              spacing: 32,
                                              children: [
                                                TextButton(
                                                    onPressed: () {},
                                                    style: TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(32),
                                                        ),
                                                        minimumSize: Size(48, 28),
                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        backgroundColor: Color(0xffD3BD9E),
                                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                                        alignment: AlignmentDirectional.centerStart
                                                    ),
                                                    child: Text(
                                                      '-',
                                                      style: GoogleFonts.inknutAntiqua(
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                ),

                                                TextButton(
                                                    onPressed: () {},

                                                    style: TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(32),
                                                        ),
                                                        minimumSize: Size(48, 28),
                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        backgroundColor: Color(0xffD3BD9E),
                                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                                        alignment: AlignmentDirectional.centerEnd
                                                    ),
                                                    child: Text(
                                                      '+',
                                                      style: GoogleFonts.inknutAntiqua(
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                ),
                                              ]
                                          ),

                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadiusGeometry.circular(32),
                                                  color: Color(0xffB09268)
                                              ),
                                              width: 81,
                                              height: 28,
                                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                              margin: EdgeInsets.fromLTRB(24, 0, 0, 0),
                                              child: Text(
                                                '69 шт',
                                                style: GoogleFonts.inknutAntiqua(
                                                  fontSize: 15,
                                                ),
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              )
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        //Карточка товара 5
                        Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              //Фото товара
                              Icon(
                                Icons.coffee_outlined,
                                size: 150,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 4,
                                children: [
                                  //Название
                                  SizedBox (
                                      width: 220,
                                      child:
                                      Text (
                                        loremIpsum(words: 2),
                                        style: GoogleFonts.inknutAntiqua(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )
                                  ),

                                  //Объём
                                  SizedBox (
                                    width: 220,
                                    child:
                                    Text (
                                      "0,296мг ",
                                      style: GoogleFonts.inknutAntiqua(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),

                                  //Акция
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadiusGeometry.circular(32),
                                        color: Color(0xffF5A22D)
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    height: 24,
                                    child:
                                    Text(
                                      "-69%",
                                      style: GoogleFonts.inknutAntiqua(
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  Row(
                                    spacing: 32,
                                    children: [

                                      //Цена
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadiusGeometry.circular(32),
                                            color: Color(0xffDD9E44)
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                        height: 28,
                                        child:
                                        Text(
                                          "999р",
                                          style: GoogleFonts.inknutAntiqua(
                                            fontSize: 16,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),

                                      //Счётчик
                                      Stack (
                                        children: [
                                          Row(
                                              spacing: 32,
                                              children: [
                                                TextButton(
                                                    onPressed: () {},
                                                    style: TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(32),
                                                        ),
                                                        minimumSize: Size(48, 28),
                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        backgroundColor: Color(0xffD3BD9E),
                                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                                        alignment: AlignmentDirectional.centerStart
                                                    ),
                                                    child: Text(
                                                      '-',
                                                      style: GoogleFonts.inknutAntiqua(
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                ),

                                                TextButton(
                                                    onPressed: () {},

                                                    style: TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(32),
                                                        ),
                                                        minimumSize: Size(48, 28),
                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        backgroundColor: Color(0xffD3BD9E),
                                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                                        alignment: AlignmentDirectional.centerEnd
                                                    ),
                                                    child: Text(
                                                      '+',
                                                      style: GoogleFonts.inknutAntiqua(
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                ),
                                              ]
                                          ),

                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadiusGeometry.circular(32),
                                                  color: Color(0xffB09268)
                                              ),
                                              width: 81,
                                              height: 28,
                                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                              margin: EdgeInsets.fromLTRB(24, 0, 0, 0),
                                              child: Text(
                                                '69 шт',
                                                style: GoogleFonts.inknutAntiqua(
                                                  fontSize: 15,
                                                ),
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              )
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        //Карточка товара 6
                        Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              //Фото товара
                              Icon(
                                Icons.coffee_outlined,
                                size: 150,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 4,
                                children: [
                                  //Название
                                  SizedBox (
                                      width: 220,
                                      child:
                                      Text (
                                        loremIpsum(words: 2),
                                        style: GoogleFonts.inknutAntiqua(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )
                                  ),

                                  //Объём
                                  SizedBox (
                                    width: 220,
                                    child:
                                    Text (
                                      "0,296мг ",
                                      style: GoogleFonts.inknutAntiqua(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),

                                  //Акция
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadiusGeometry.circular(32),
                                        color: Color(0xffF5A22D)
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    height: 24,
                                    child:
                                    Text(
                                      "-69%",
                                      style: GoogleFonts.inknutAntiqua(
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  Row(
                                    spacing: 32,
                                    children: [

                                      //Цена
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadiusGeometry.circular(32),
                                            color: Color(0xffDD9E44)
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                        height: 28,
                                        child:
                                        Text(
                                          "999р",
                                          style: GoogleFonts.inknutAntiqua(
                                            fontSize: 16,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),

                                      //Счётчик
                                      Stack (
                                        children: [
                                          Row(
                                              spacing: 32,
                                              children: [
                                                TextButton(
                                                    onPressed: () {},
                                                    style: TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(32),
                                                        ),
                                                        minimumSize: Size(48, 28),
                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        backgroundColor: Color(0xffD3BD9E),
                                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                                        alignment: AlignmentDirectional.centerStart
                                                    ),
                                                    child: Text(
                                                      '-',
                                                      style: GoogleFonts.inknutAntiqua(
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                ),

                                                TextButton(
                                                    onPressed: () {},

                                                    style: TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(32),
                                                        ),
                                                        minimumSize: Size(48, 28),
                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        backgroundColor: Color(0xffD3BD9E),
                                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                                        alignment: AlignmentDirectional.centerEnd
                                                    ),
                                                    child: Text(
                                                      '+',
                                                      style: GoogleFonts.inknutAntiqua(
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                ),
                                              ]
                                          ),

                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadiusGeometry.circular(32),
                                                  color: Color(0xffB09268)
                                              ),
                                              width: 81,
                                              height: 28,
                                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                              margin: EdgeInsets.fromLTRB(24, 0, 0, 0),
                                              child: Text(
                                                '69 шт',
                                                style: GoogleFonts.inknutAntiqua(
                                                  fontSize: 15,
                                                ),
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              )
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        //Карточка товара 7
                        Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              //Фото товара
                              Icon(
                                Icons.coffee_outlined,
                                size: 150,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 4,
                                children: [
                                  //Название
                                  SizedBox (
                                      width: 220,
                                      child:
                                      Text (
                                        loremIpsum(words: 2),
                                        style: GoogleFonts.inknutAntiqua(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )
                                  ),

                                  //Объём
                                  SizedBox (
                                    width: 220,
                                    child:
                                    Text (
                                      "0,296мг ",
                                      style: GoogleFonts.inknutAntiqua(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),

                                  //Акция
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadiusGeometry.circular(32),
                                        color: Color(0xffF5A22D)
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    height: 24,
                                    child:
                                    Text(
                                      "-69%",
                                      style: GoogleFonts.inknutAntiqua(
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  Row(
                                    spacing: 32,
                                    children: [

                                      //Цена
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadiusGeometry.circular(32),
                                            color: Color(0xffDD9E44)
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                        height: 28,
                                        child:
                                        Text(
                                          "999р",
                                          style: GoogleFonts.inknutAntiqua(
                                            fontSize: 16,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),

                                      //Счётчик
                                      Stack (
                                        children: [
                                          Row(
                                              spacing: 32,
                                              children: [
                                                TextButton(
                                                    onPressed: () {},
                                                    style: TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(32),
                                                        ),
                                                        minimumSize: Size(48, 28),
                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        backgroundColor: Color(0xffD3BD9E),
                                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                                        alignment: AlignmentDirectional.centerStart
                                                    ),
                                                    child: Text(
                                                      '-',
                                                      style: GoogleFonts.inknutAntiqua(
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                ),

                                                TextButton(
                                                    onPressed: () {},

                                                    style: TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(32),
                                                        ),
                                                        minimumSize: Size(48, 28),
                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        backgroundColor: Color(0xffD3BD9E),
                                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                                        alignment: AlignmentDirectional.centerEnd
                                                    ),
                                                    child: Text(
                                                      '+',
                                                      style: GoogleFonts.inknutAntiqua(
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                ),
                                              ]
                                          ),

                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadiusGeometry.circular(32),
                                                  color: Color(0xffB09268)
                                              ),
                                              width: 81,
                                              height: 28,
                                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                              margin: EdgeInsets.fromLTRB(24, 0, 0, 0),
                                              child: Text(
                                                '69 шт',
                                                style: GoogleFonts.inknutAntiqua(
                                                  fontSize: 15,
                                                ),
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              )
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        //Карточка товара 8
                        Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              //Фото товара
                              Icon(
                                Icons.coffee_outlined,
                                size: 150,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 4,
                                children: [
                                  //Название
                                  SizedBox (
                                      width: 220,
                                      child:
                                      Text (
                                        loremIpsum(words: 2),
                                        style: GoogleFonts.inknutAntiqua(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )
                                  ),

                                  //Объём
                                  SizedBox (
                                    width: 220,
                                    child:
                                    Text (
                                      "0,296мг ",
                                      style: GoogleFonts.inknutAntiqua(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),

                                  //Акция
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadiusGeometry.circular(32),
                                        color: Color(0xffF5A22D)
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    height: 24,
                                    child:
                                    Text(
                                      "-69%",
                                      style: GoogleFonts.inknutAntiqua(
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  Row(
                                    spacing: 32,
                                    children: [

                                      //Цена
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadiusGeometry.circular(32),
                                            color: Color(0xffDD9E44)
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                        height: 28,
                                        child:
                                        Text(
                                          "999р",
                                          style: GoogleFonts.inknutAntiqua(
                                            fontSize: 16,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),

                                      //Счётчик
                                      Stack (
                                        children: [
                                          Row(
                                              spacing: 32,
                                              children: [
                                                TextButton(
                                                    onPressed: () {},
                                                    style: TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(32),
                                                        ),
                                                        minimumSize: Size(48, 28),
                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        backgroundColor: Color(0xffD3BD9E),
                                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                                        alignment: AlignmentDirectional.centerStart
                                                    ),
                                                    child: Text(
                                                      '-',
                                                      style: GoogleFonts.inknutAntiqua(
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                ),

                                                TextButton(
                                                    onPressed: () {},

                                                    style: TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(32),
                                                        ),
                                                        minimumSize: Size(48, 28),
                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        backgroundColor: Color(0xffD3BD9E),
                                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                                        alignment: AlignmentDirectional.centerEnd
                                                    ),
                                                    child: Text(
                                                      '+',
                                                      style: GoogleFonts.inknutAntiqua(
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                ),
                                              ]
                                          ),

                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadiusGeometry.circular(32),
                                                  color: Color(0xffB09268)
                                              ),
                                              width: 81,
                                              height: 28,
                                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                              margin: EdgeInsets.fromLTRB(24, 0, 0, 0),
                                              child: Text(
                                                '69 шт',
                                                style: GoogleFonts.inknutAntiqua(
                                                  fontSize: 15,
                                                ),
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              )
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        //Карточка товара 9
                        Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              //Фото товара
                              Icon(
                                Icons.coffee_outlined,
                                size: 150,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 4,
                                children: [
                                  //Название
                                  SizedBox (
                                      width: 220,
                                      child:
                                      Text (
                                        loremIpsum(words: 2),
                                        style: GoogleFonts.inknutAntiqua(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )
                                  ),

                                  //Объём
                                  SizedBox (
                                    width: 220,
                                    child:
                                    Text (
                                      "0,296мг ",
                                      style: GoogleFonts.inknutAntiqua(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),

                                  //Акция
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadiusGeometry.circular(32),
                                        color: Color(0xffF5A22D)
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    height: 24,
                                    child:
                                    Text(
                                      "-69%",
                                      style: GoogleFonts.inknutAntiqua(
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  Row(
                                    spacing: 32,
                                    children: [

                                      //Цена
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadiusGeometry.circular(32),
                                            color: Color(0xffDD9E44)
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                        height: 28,
                                        child:
                                        Text(
                                          "999р",
                                          style: GoogleFonts.inknutAntiqua(
                                            fontSize: 16,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),

                                      //Счётчик
                                      Stack (
                                        children: [
                                          Row(
                                              spacing: 32,
                                              children: [
                                                TextButton(
                                                    onPressed: () {},
                                                    style: TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(32),
                                                        ),
                                                        minimumSize: Size(48, 28),
                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        backgroundColor: Color(0xffD3BD9E),
                                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                                        alignment: AlignmentDirectional.centerStart
                                                    ),
                                                    child: Text(
                                                      '-',
                                                      style: GoogleFonts.inknutAntiqua(
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                ),

                                                TextButton(
                                                    onPressed: () {},

                                                    style: TextButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(32),
                                                        ),
                                                        minimumSize: Size(48, 28),
                                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                        backgroundColor: Color(0xffD3BD9E),
                                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                                        alignment: AlignmentDirectional.centerEnd
                                                    ),
                                                    child: Text(
                                                      '+',
                                                      style: GoogleFonts.inknutAntiqua(
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                ),
                                              ]
                                          ),

                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadiusGeometry.circular(32),
                                                  color: Color(0xffB09268)
                                              ),
                                              width: 81,
                                              height: 28,
                                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                              margin: EdgeInsets.fromLTRB(24, 0, 0, 0),
                                              child: Text(
                                                '69 шт',
                                                style: GoogleFonts.inknutAntiqua(
                                                  fontSize: 15,
                                                ),
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              )
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),

                        SizedBox(height: 32,),

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
                                    fontSize: 14
                                  ),
                                  hintMaxLines: 1,
                                ),
                              ),
                            ),
                            SizedBox(height: 81,),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  backgroundColor: Color(0xFFD3BD9E)
                              ),
                              child: Text(
                                "Применить",
                                style: GoogleFonts.inknutAntiqua(
                                  color: Color(0xff444444),
                                  fontSize: 14
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                              )
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "У вас есть бонусов: 360000000",
                                style: GoogleFonts.inknutAntiqua(
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    backgroundColor: Color(0xFFD3BD9E)
                                ),
                                child: Text(
                                  "Списать бонусы",
                                  style: GoogleFonts.inknutAntiqua(color: Color(0xff444444)),
                                )
                            )
                          ],
                        ),

                        SizedBox(height: 190,)
                      ]
                    )
                  )
                ),
              ]
            ),
          ),
          //Фон итогов
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 200,
            child:(
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentGeometry.bottomCenter,
                    end: AlignmentGeometry.topCenter,
                    colors: <Color> [
                      Color(0xffffffff),
                      Color(0x00ffffff),
                    ]
                  )
                ),
              )
            )
          ),
          //Итоги
          Positioned (
            left: 8,
            right: 8,
            bottom: 64,
            height: 135,
            child: Card(
              child: Container (
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Row (
                      children: [
                        Text (
                          "Без скидки",
                          style: GoogleFonts.inknutAntiqua(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded (
                          child: Text (
                            ".....................................................",
                            style: GoogleFonts.inknutAntiqua(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text (
                          "9999р",
                          style: GoogleFonts.inknutAntiqua(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ]
                    ),
                    Row (
                      children: [
                        Text (
                          "С учётом скидки",
                          style: GoogleFonts.inknutAntiqua(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded (
                          child: Text (
                            ".....................................................",
                            style: GoogleFonts.inknutAntiqua(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text (
                          "999р",
                          style: GoogleFonts.inknutAntiqua(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ]
                    ),
                    Row (
                      children: [
                        Text (
                          "Спишется бонусов",
                          style: GoogleFonts.inknutAntiqua(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded (
                          child: Text (
                            ".....................................................",
                            style: GoogleFonts.inknutAntiqua(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text (
                          "99",
                          style: GoogleFonts.inknutAntiqua(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ]
                    ),
                    SizedBox(height: 8,),
                    Text(
                      "Итого: ",
                      style: GoogleFonts.inknutAntiqua(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ),
          )
        ]
      ),

      floatingActionButton: FloatingActionButton.extended (
          onPressed: () {},
          backgroundColor: Color(0xFFD3BD9E),
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(32)),

          label: Text(
            "Заказать",
            style: GoogleFonts.inknutAntiqua(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0xff444444)
            ),
          )
      ),
    );
  }
}