import 'package:coffee_lake_app/features/menu/data/datasources/MenuRemoteDataSource.dart';
import 'package:coffee_lake_app/features/menu/data/models/MenuData.dart';

class GetMenuUseCase {
  MenuRemoteDataSource menuRemoteDataSource;

  GetMenuUseCase(this.menuRemoteDataSource);

  Future<MenuData> call() async {
    return menuRemoteDataSource.getMenu();
  }
}
