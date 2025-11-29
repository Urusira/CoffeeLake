import 'package:coffee_lake_app/ui/mainPage/widgets/MainPageWidget.dart';
import 'package:coffee_lake_app/ui/cart/widgets/CartWidget.dart';
import 'package:coffee_lake_app/ui/menu/widgets/MenuWidget.dart';
import 'package:coffee_lake_app/ui/auth/widgets/AuthWidget.dart';
import 'package:coffee_lake_app/ui/profile/widgets/ProfileWidget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPageWidget()
    );
  }
}