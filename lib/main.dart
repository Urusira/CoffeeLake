import 'package:coffee_lake_app/features/mainPage/view/MainPageWidget.dart';
import 'package:flutter/material.dart';

import 'core/di.dart';

void main() {
  diSetup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MainPageWidget());
  }
}
