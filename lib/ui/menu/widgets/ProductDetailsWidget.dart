import 'package:coffee_lake_app/data/models/product/CartProductData.dart';
import 'package:coffee_lake_app/data/models/product/ProductData.dart';
import 'package:coffee_lake_app/data/repository/local/CartRepository.dart';
import 'package:coffee_lake_app/data/repository/remote/Fake.dart';
import 'package:coffee_lake_app/ui/profile/widgets/ProfileWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class ProductDetailsWidget extends StatefulWidget {
  final int productId;

  const ProductDetailsWidget({super.key, required this.productId});

  @override
  State<StatefulWidget> createState() => ProductDetailsState();
}

class ProductDetailsState extends State<ProductDetailsWidget> {
  late Product product;
  late double productVol = product.sizes.first * 1000;

  @override
  void initState() {
    super.initState();
    product = Fake.getProductById(widget.productId);
  }

  Widget? getVolumes() {
    return IgnorePointer(
      ignoring: true,
      child: Container(
        padding: EdgeInsets.fromLTRB(19, 12, 17, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: product.sizes
              .map(
                (size) => Text(
                  "${size} л",
                  style: GoogleFonts.inknutAntiqua(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  int getVolCount() {
    if (product.sizes.length - 1 <= 0) {
      return product.sizes.length;
    }
    return product.sizes.length - 1;
  }

  double getPrice() {
    return product.basePrice[product.sizes.indexOf(productVol / 1000)];
  }

  Widget getCardFooter() {
    if (!CartRepository.contains(product.id, productVol)) {
      //Добавление товара
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          //Кнопка "В корзину"
          ElevatedButton(
            onPressed: () {
              CartRepository.add(
                CartProductData(
                  id: product.id,
                  name: product.name,
                  price: getPrice(),
                  sale: product.sale,
                  vol: productVol,
                  count: 1,
                ),
              );
              setState(() {});
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              backgroundColor: Color(0xffD3BD9E),
            ),
            child: Text(
              "${getPrice()} р",
              style: GoogleFonts.inknutAntiqua(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Color(0xff222222),
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          //Выбор количества
          TextButton(
            onPressed: () {
              setState(() {
                CartRepository.remove(product.id, productVol);
              });
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(48),
              ),
              backgroundColor: Color(0xffD3BD9E),
              minimumSize: Size(42, 42),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              alignment: AlignmentDirectional.center,
            ),
            child: Text(
              "-",
              style: GoogleFonts.inknutAntiqua(
                fontSize: 19,
                color: Color(0xff222222),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusGeometry.circular(32),
              color: Color(0xffD3BD9E),
            ),
            height: 42,
            width: 81,
            alignment: AlignmentDirectional.center,
            child: Text(
              "${CartRepository.count(product.id, productVol)} шт",
              style: GoogleFonts.inknutAntiqua(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff222222),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                CartRepository.add(
                  CartProductData(
                    id: product.id,
                    name: product.name,
                    price: getPrice(),
                    sale: product.sale,
                    vol: productVol,
                    count: 1,
                  ),
                );
              });
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(48),
              ),
              backgroundColor: Color(0xffD3BD9E),
              minimumSize: Size(42, 42),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              alignment: AlignmentDirectional.center,
            ),
            child: Text(
              "+",
              style: GoogleFonts.inknutAntiqua(
                fontSize: 19,
                color: Color(0xff222222),
              ),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      //Карточка товара
      child: Card(
        elevation: 0,
        child: Column(
          children: [
            Row(
              children: [
                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  backgroundColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  hoverElevation: 0,
                  focusElevation: 0,
                  highlightElevation: 0,
                  disabledElevation: 0,
                  elevation: 0,
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  label: Text(
                    "Назад",
                    style: GoogleFonts.inknutAntiqua(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      color: Color(0xff444444),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Фото товара
                Icon(Icons.coffee_outlined, size: 130),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    //Название
                    SizedBox(
                      width: 150,
                      child: Text(
                        product.name,
                        style: GoogleFonts.inknutAntiqua(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),

                    //Описание
                    SizedBox(
                      width: 175,
                      height: 150,
                      child: Text(
                        product.description,
                        style: GoogleFonts.inknutAntiqua(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //Отступ
            SizedBox(height: 8),

            Column(
              children: [
                //Выбор объёма
                Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Row(
                    spacing: 32,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Выберите\nобъём:",
                        style: GoogleFonts.inknutAntiqua(
                          fontSize: 14,
                          color: Color(0xff444444),
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Positioned(
                              top: 7,
                              left: 14,
                              child: Container(
                                width: 181,
                                height: 34,
                                margin: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    32,
                                  ),
                                  color: Color(0xffD3BD9E),
                                ),
                              ),
                            ),

                            SliderTheme(
                              data: SliderThemeData(
                                thumbShape: HandleThumbShape(),
                                thumbSize: WidgetStateProperty.all(
                                  Size(52, 32),
                                ),
                                activeTrackColor: Color(0xffD3BD9E),
                                inactiveTrackColor: Color(0xffD3BD9E),
                                activeTickMarkColor: Colors.transparent,
                                inactiveTickMarkColor: Colors.transparent,
                                thumbColor: Color(0xffB09268),
                                overlayColor: Colors.transparent,
                                valueIndicatorColor: Color(0xffB09268),
                                trackHeight: 32,
                              ),
                              child: Slider(
                                value: productVol,
                                min: product.sizes.first * 1000,
                                max: product.sizes.last * 1000,
                                divisions: getVolCount(),
                                onChanged: (double value) {
                                  productVol = value;
                                  setState(() {});
                                },
                              ),
                            ),
                            ?getVolumes(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                getCardFooter(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
