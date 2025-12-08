import 'package:flutter/material.dart';

import '../core/di.dart';
import '../features/auth/view/AuthWidget.dart';
import '../features/profile/domain/usecases/GetProfileUseCase.dart';
import '../features/profile/view/ProfileWidget.dart';

class ProfileService {
  static Future<void> openProfile(BuildContext context) async {
    final profile = await di<GetProfileUseCase>().call();

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => profile != null ? ProfileWidget() : AuthWidget(),
      ),
    );
  }
}
